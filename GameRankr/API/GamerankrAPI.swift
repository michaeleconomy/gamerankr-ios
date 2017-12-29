import Foundation
import Apollo
import Dispatch

let api = GamerankrAPI()

protocol APIErrorDelegate {
    func handleAPI(error: String)
}
protocol AuthenticatedAPIErrorDelegate : APIErrorDelegate {
    func handleAPIAuthenticationError()
}
protocol APISearchResultsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPISearch(results: [SearchQuery.Data.Game])
}

protocol APIMyGamesDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPIMyGames(response: MyGamesQuery.Data.MyGame)
}

protocol APIGameDetailDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(gameDetail: GameQuery.Data.Game)
}

protocol APIUserDetailDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(userDetail: UserDetail)
}

protocol APIUpdatesDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(updates: [RankingWithUser])
}

protocol APIFriendsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(friends: [UserBasic])
}

protocol APIRankDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(ranking: RankingBasic)
}

protocol APIDestroyRankingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking)
}

protocol APIShelvesDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf])
}

protocol APILoginDelegate : APIErrorDelegate {
    func handleAPILogin()
}

protocol APIAuthenticationDelegate {
    func handleAPILogin()
    func handleAPILogout()
}

class GamerankrAPI {
    
    public private(set) var signed_in = false
    let base_url = "http://localhost:3000"
//    let base_url = "https://www.gamerankr.com"
    private let apollo: ApolloClient
    private var authDelegates = [APIAuthenticationDelegate]()
    public private(set) var token: String?
    
    init() {
        self.token = LocalSQLiteManager.sharedInstance.getToken()
        if token != nil {
            self.signed_in = true
        }
        apollo = ApolloClient(networkTransport: GameRankrNetworkTransport())
    }
    
    func register(authenticationDelegate: APIAuthenticationDelegate) {
        authDelegates.append(authenticationDelegate)
    }

    func login(fbAuthToken: String, delegate: APILoginDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "fb_auth_token", value: fbAuthToken)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!) as! [String: String]
            self.handleLogin(token: json["token"]!)
            
            delegate.handleAPILogin()
        }
        task.resume()
    }
    
    private func handleLogin(token: String) {
        NSLog("login was successful.")
        self.signed_in = true
        self.token = token
        LocalSQLiteManager.sharedInstance.persistToken(token: token)
        
        MyGamesManager.sharedInstance.load()
        for authDelegate in authDelegates {
            authDelegate.handleAPILogin()
        }
    }
    
    private func handleLogout() {
        self.signed_in = false
        MyGamesManager.sharedInstance.clear()
        LocalSQLiteManager.sharedInstance.clearMisc()
        for authDelegate in authDelegates {
            authDelegate.handleAPILogout()
        }
    }
    

    func search(query: String, delegate: APISearchResultsDelegate) {
        apollo.fetch(query: SearchQuery(query: query)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPISearch(results: result!.data!.games)
        }
    }
    
    func gameDetail(id: String, delegate: APIGameDetailDelegate) {
        apollo.fetch(query: GameQuery(id: id)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(gameDetail: result!.data!.game)
        }
    }
    
    func userDetail(id: String, delegate: APIUserDetailDelegate) {
        apollo.fetch(query: UserQuery(id: id)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(userDetail: result!.data!.user.fragments.userDetail)
        }
    }
    
    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: MeQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(userDetail: result!.data!.user.fragments.userDetail)
        }
    }
    
    
    func myShelves(delegate: APIShelvesDelegate) {
        apollo.fetch(query: MyShelvesQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(shelves: result!.data!.shelves)
        }
    }
    
    
    func myGames(after: String? = nil, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: MyGamesQuery(after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPIMyGames(response: result!.data!.myGames)
        }
    }
    
    func updates(delegate: APIUpdatesDelegate) {
        apollo.fetch(query: UpdatesQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(updates: result!.data!.updates.edges!.map{$0!.ranking!.fragments.rankingWithUser})
        }
    }
    
    func friends(delegate: APIFriendsDelegate) {
        apollo.fetch(query: FriendsQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(friends: result!.data!.friends.edges!.map{$0!.user!.fragments.userBasic})
        }
    }
    
    func rankPort(portId: GraphQLID, ranking: Int?, removeRanking: Bool, review: String?, addShelfId: GraphQLID?, removeShelfId: GraphQLID?, delegate: APIRankDelegate) {
        apollo.perform(mutation: RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(ranking: result!.data!.ranking.fragments.rankingBasic)
        }
    }
    
    func destroyRanking(portId: GraphQLID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: DestroyRankingMutation(portId: portId)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPIRankingDestruction(ranking: result!.data!.ranking)
        }
    }
    
    private func handleApolloApiErrors<Type>(_ result: GraphQLResult<Type>?, _ error: Error?, delegate: APIErrorDelegate) -> Bool {
        if ((error as? GameRankrAuthenticationError) != nil) {
            NSLog("authentication error - signing user out")
            handleLogout()
            
            return false
        }
        if (result?.data == nil) {
            delegate.handleAPI(error: "data was nil, error: \(String(describing: error))")
            return false
        }
        if (result?.errors != nil && result!.errors!.count > 0) {
            let errorsStr = result!.errors!.map{$0.message}.joined(separator: ", ")
            delegate.handleAPI(error: "server side error(s): \(errorsStr)")
            return false
        }
        return true
    }
    
    private func handleAPIErrorsBasic(data: Data?, response: URLResponse?, error: Error?, apiErrorDelegate: APIErrorDelegate) -> Bool {
        if let error = error {
            apiErrorDelegate.handleAPI(error: "error: \(error)")
            return false
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            apiErrorDelegate.handleAPI(error: "server error, response: \(String(describing: response))")
            return false
        }
        return true
    }
}

