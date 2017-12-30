import Foundation
import Apollo

let api = GamerankrAPI()

protocol APIErrorDelegate {
    func handleAPI(error: String)
}
protocol AuthenticatedAPIErrorDelegate : APIErrorDelegate {
    func handleAPIAuthenticationError()
}
protocol APISearchResultsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPISearch(results: [GameBasic], nextPage: String?)
}

protocol APIMyGamesDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPIMyGames(rankings: [RankingBasic], nextPage: String?)
}

protocol APIGameDetailDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(gameDetail: GameQuery.Data.Game, rankings: [RankingForGame], nextPage: String?)
}

protocol APIGameRankingsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingForGame], nextPage: String?)
}

protocol APIUserDetailDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(userDetail: UserDetail, rankings: [RankingBasic], nextPage: String?)
}

protocol APIUserRankingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingBasic], nextPage: String?)
}

protocol APIUserRankingsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingBasic], nextPage: String?)
}

protocol APIUpdatesDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(updates: [RankingWithUser], nextPage: String?)
}

protocol APIFriendsDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(friends: [UserBasic], nextPage: String?)
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
//    let base_url = "http://localhost:3000"
    let base_url = "https://www.gamerankr.com"
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
    

    func search(query: String, after: String? = nil, delegate: APISearchResultsDelegate) -> Cancellable {
        return apollo.fetch(query: SearchQuery(query: query, after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let games = result!.data!.search
            var nextPage : String?
            if (games.pageInfo.hasNextPage){
                nextPage = games.pageInfo.endCursor
            }
            let results = games.edges!.map{$0!.game!.fragments.gameBasic}
            delegate.handleAPISearch(results: results, nextPage: nextPage)
        }
    }
    
    func gameDetail(id: GraphQLID, delegate: APIGameDetailDelegate) {
        apollo.fetch(query: GameQuery(id: id)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let game = result!.data!.game
            let rankingEdges = game.rankings
            
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.node!.fragments.rankingForGame}
            delegate.handleAPI(gameDetail: game, rankings: rankings, nextPage: nextPage)
        }
    }
    
    func gameRankings(id: GraphQLID, after: String? = nil, delegate: APIGameRankingsDelegate) {
        apollo.fetch(query: GameRankingsQuery(id: id, after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let rankingEdges = result!.data!.game.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingForGame}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func userDetail(id: GraphQLID, delegate: APIUserDetailDelegate) {
        apollo.fetch(query: UserQuery(id: id)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let user = result!.data!.user
            let rankingEdges = user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingBasic}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }

    func userRankings(id: String, after: String? = nil, delegate: APIUserRankingDelegate) {
        apollo.fetch(query: UserRankingsQuery(id: id, after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let rankingEdges = result!.data!.user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingBasic}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: MeQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let user = result!.data!.user
            let rankingEdges = user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingBasic}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
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
            let myGames = result!.data!.myGames
            
            var nextPage : String?
            if (myGames.pageInfo.hasNextPage){
                nextPage = myGames.pageInfo.endCursor
            }
            let rankings = myGames.edges!.map{$0!.ranking!.fragments.rankingBasic}
            delegate.handleAPIMyGames(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func updates(after: String? = nil, delegate: APIUpdatesDelegate) {
        apollo.fetch(query: UpdatesQuery(after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let updates = result!.data!.updates
            var nextPage : String?
            if (updates.pageInfo.hasNextPage){
                nextPage = updates.pageInfo.endCursor
            }
            delegate.handleAPI(updates: updates.edges!.map{$0!.ranking!.fragments.rankingWithUser}, nextPage: nextPage)
        }
    }
    
    func friends(after: String? = nil, delegate: APIFriendsDelegate) {
        apollo.fetch(query: FriendsQuery(after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let friends = result!.data!.friends
            var nextPage : String?
            if (friends.pageInfo.hasNextPage){
                nextPage = friends.pageInfo.endCursor
            }
            delegate.handleAPI(friends: friends.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
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
    
    private func handleApolloApiErrors<Type>(_ result: GraphQLResult<Type>?, _ error: Error?, delegate: AuthenticatedAPIErrorDelegate) -> Bool {
        if ((error as? GameRankrAuthenticationError) != nil) {
            NSLog("authentication error - signing user out")
            handleLogout()
            delegate.handleAPIAuthenticationError()
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
