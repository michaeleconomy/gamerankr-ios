import Foundation
import Apollo

let api = GamerankrAPI()

protocol APIErrorDelegate {
    func handleApi(error: String)
}
protocol APISearchResultsDelegate : APIErrorDelegate {
    func handleAPISearch(results: [SearchQuery.Data.Game])
}

protocol APIMyGamesDelegate : APIErrorDelegate {
    func handleAPIMyGames(response: MyGamesQuery.Data.MyGame)
}

protocol APIGameDetailDelegate : APIErrorDelegate {
    func handleAPI(gameDetail: GameQuery.Data.Game)
}

protocol APIUserDetailDelegate : APIErrorDelegate {
    func handleAPI(userDetail: UserDetail)
}

protocol APIUpdatesDelegate : APIErrorDelegate {
    func handleAPI(updates: [RankingWithUser])
}

protocol APIFriendsDelegate : APIErrorDelegate {
    func handleAPI(friends: [UserBasic])
}

protocol APIRankDelegate : APIErrorDelegate {
    func handleAPI(ranking: RankingBasic)
}

protocol APIDestroyRankingDelegate : APIErrorDelegate {
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking)
}

protocol APIShelvesDelegate : APIErrorDelegate {
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf])
}

protocol APILoginDelegate : APIErrorDelegate {
    func handleAPILogin()
}

class GamerankrAPI {
    
    public private(set) var signed_in = false
//    let base_url = "http://localhost:3000"
    let base_url = "https://www.gamerankr.com"
    let apollo: ApolloClient
    
    init() {
        apollo = ApolloClient(url: URL(string: "\(base_url)/graphql")!)
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
            NSLog("login was successful. Data: \(String(describing: data))")
            self.signed_in = true
            MyGamesManager.sharedInstance.load()
            MyShelvesManager.sharedInstance.load()
            // success!
            delegate.handleAPILogin()
        }
        task.resume()
    }

    func search(query: String, delegate: APISearchResultsDelegate) {
        apollo.fetch(query: SearchQuery(query: query)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPISearch(results: data.games)
        }
    }
    
    func gameDetail(id: String, delegate: APIGameDetailDelegate) {
        apollo.fetch(query: GameQuery(id: id)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(gameDetail: data.game)
        }
    }
    
    
    func userDetail(id: String, delegate: APIUserDetailDelegate) {
        apollo.fetch(query: UserQuery(id: id)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(userDetail: data.user.fragments.userDetail)
        }
    }
    
    
    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: MeQuery()) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(userDetail: data.user.fragments.userDetail)
        }
    }
    
    
    func myShelves(delegate: APIShelvesDelegate) {
        apollo.fetch(query: MyShelvesQuery()) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(shelves: data.shelves)
        }
    }
    
    
    func myGames(after: String? = nil, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: MyGamesQuery(after: after)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPIMyGames(response: data.myGames)
        }
    }
    
    func updates(delegate: APIUpdatesDelegate) {
        apollo.fetch(query: UpdatesQuery()) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(updates: (data.updates.edges!.map{($0?.ranking!.fragments.rankingWithUser)!}))
        }
    }
    
    func friends(delegate: APIFriendsDelegate) {
        apollo.fetch(query: FriendsQuery()) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(friends: (data.friends.edges!.map{($0?.user!.fragments.userBasic)!}))
        }
    }
    
    func rankPort(portId: GraphQLID, ranking: Int?, removeRanking: Bool, review: String?, addShelfId: GraphQLID?, removeShelfId: GraphQLID?, delegate: APIRankDelegate) {
        apollo.perform(mutation: RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPI(ranking: data.ranking.fragments.rankingBasic)
        }
    }
    
    func destroyRanking(portId: GraphQLID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: DestroyRankingMutation(portId: portId)) { (result, error) in
            guard let data = result?.data else {
                delegate.handleApi(error: "error: \(String(describing: error))")
                return
            }
            delegate.handleAPIRankingDestruction(ranking: data.ranking)
        }
    }
    
    private func handleAPIErrorsBasic(data: Data?, response: URLResponse?, error: Error?, apiErrorDelegate: APIErrorDelegate) -> Bool {
        if let error = error {
            apiErrorDelegate.handleApi(error: "error: \(error)")
            return false
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            apiErrorDelegate.handleApi(error: "server error, response: \(String(describing: response))")
            return false
        }
        return true
    }
}

