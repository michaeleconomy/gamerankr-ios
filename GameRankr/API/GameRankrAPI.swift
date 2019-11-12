import Foundation
import Apollo

let api = GameRankrAPI()

protocol APIErrorDelegate {
    func handleAPI(error: String)
}
protocol AuthenticatedAPIErrorDelegate : APIErrorDelegate {
    func handleAPIAuthenticationError()
}

extension AuthenticatedAPIErrorDelegate where Self: UIViewController {
    func handleAPIAuthenticationError() {
        easyAlert("Authentication Error!")
    }
}

protocol APISearchResultsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPISearch(results: [GameBasic], nextPage: String?)
}

protocol APIMyGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIMyGames(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIGameDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(gameDetail: GameQuery.Data.Game, rankings: [RankingWithUser], friendRankings: [RankingWithUser], nextPage: String?)
}

protocol APIGameRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithUser], nextPage: String?)
}

protocol APIUserDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(userDetail: UserDetail, rankings: [RankingWithGame], nextPage: String?)
}

protocol APIUserRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIShelfDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIUpdatesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(updates: [RankingFull], nextPage: String?)
}

protocol APIFriendsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(friends: [UserBasic], nextPage: String?)
}

protocol APIRankDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(ranking: RankingWithGame)
}

protocol APIDestroyRankingDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking)
}

protocol APIShelvesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf])
}

class GameRankrAPI {
    
    public internal(set) var signedIn = false
    var signedOut: Bool {
        get {
            return !signedIn
        }
    }
    
//    let base_url = "http://localhost:3000"
    let base_url = "https://www.gamerankr.com"
    internal var authDelegates = [APIAuthenticationDelegate]()
    public internal(set) var token: String?
    public internal(set) var currentUserId: GraphQLID?
    private(set) lazy var apollo = ApolloClient(url: URL(string: api.base_url + "/graphql")!)
    init() {
        let token = LocalSQLiteManager.sharedInstance.getMisc(key: "token")
        let currentUserId = LocalSQLiteManager.sharedInstance.getMisc(key: "currentUserId")
        self.token = token
        self.currentUserId = currentUserId
        if (token != nil && currentUserId != nil) {
            self.signedIn = true
        }
        else {
            self.token = nil
            self.currentUserId = nil
            LocalSQLiteManager.sharedInstance.clearRankings()
            LocalSQLiteManager.sharedInstance.clearMisc()
        }
//        apollo = ApolloClient(networkTransport: GameRankrNetworkTransport())
    }
    
    
    func search(query: String, after: String? = nil, delegate: APISearchResultsDelegate) -> Cancellable {
        return apollo.fetch(query: SearchQuery(query: query, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let games = data!.search
            var nextPage : String?
            if (games.pageInfo.hasNextPage){
                nextPage = games.pageInfo.endCursor
            }
            let results = games.edges!.map{$0!.game!.fragments.gameBasic}
            delegate.handleAPISearch(results: results, nextPage: nextPage)
        }
    }
    
    func gameDetail(id: GraphQLID, delegate: APIGameDetailDelegate) {
        apollo.fetch(query: GameQuery(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let game = data!.game
            let rankingEdges = game.rankings
            
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.node!.fragments.rankingWithUser}
            let friendRankings = game.friendRankings.map{$0.fragments.rankingWithUser}
            delegate.handleAPI(gameDetail: game, rankings: rankings, friendRankings: friendRankings, nextPage: nextPage)
        }
    }
    
    func gameRankings(id: GraphQLID, after: String? = nil, delegate: APIGameRankingsDelegate) {
        apollo.fetch(query: GameRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data!.game.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithUser}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func shelf(id: GraphQLID, after: String? = nil, delegate: APIShelfDelegate) {
        apollo.fetch(query: ShelfQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data!.shelf.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage) {
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func userDetail(id: GraphQLID, delegate: APIUserDetailDelegate) {
        apollo.fetch(query: UserQuery(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let user = data!.user
            let rankingEdges = user.fragments.userDetail.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }

    func userRankings(id: String, after: String? = nil, delegate: APIUserRankingsDelegate) {
        apollo.fetch(query: UserRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data!.user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: MeQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let user = data!.user
            let rankingEdges = user.fragments.userDetail.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }
    
    func myShelves(delegate: APIShelvesDelegate) {
        apollo.fetch(query: MyShelvesQuery(), cachePolicy: .fetchIgnoringCacheData) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPI(shelves: data!.shelves)
        }
    }
    
    func myGames(after: String? = nil, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: MyGamesQuery(after: after), cachePolicy: .fetchIgnoringCacheData) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let myGames = data!.myGames
            
            var nextPage : String?
            if (myGames.pageInfo.hasNextPage){
                nextPage = myGames.pageInfo.endCursor
            }
            let rankings = myGames.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPIMyGames(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func updates(after: String? = nil, delegate: APIUpdatesDelegate) {
        apollo.fetch(query: UpdatesQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let updates = data!.updates
            var nextPage : String?
            if (updates.pageInfo.hasNextPage){
                nextPage = updates.pageInfo.endCursor
            }
            delegate.handleAPI(updates: updates.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
        }
    }
    
    func friends(after: String? = nil, delegate: APIFriendsDelegate) {
        apollo.fetch(query: FriendsQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let friends = data!.friends
            var nextPage : String?
            if (friends.pageInfo.hasNextPage){
                nextPage = friends.pageInfo.endCursor
            }
            delegate.handleAPI(friends: friends.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
        }
    }
    
    // - mutations
    func rankPort(portId: GraphQLID, ranking: Int?, removeRanking: Bool, review: String?, addShelfId: GraphQLID?, removeShelfId: GraphQLID?, delegate: APIRankDelegate) {
        apollo.perform(mutation: RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPI(ranking: data!.ranking.fragments.rankingWithGame)
        }
    }
    
    func destroyRanking(portId: GraphQLID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: DestroyRankingMutation(portId: portId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPIRankingDestruction(ranking: data!.ranking)
        }
    }
    
    internal func handleApolloApiErrors<Data>(_ result: Result<GraphQLResult<Data>, Error>, delegate: AuthenticatedAPIErrorDelegate) -> Bool {
        switch result {
        case .success(let graphQLResult):
            if graphQLResult.data != nil {
                return true
            }
            else if let errors = graphQLResult.errors {
                let errorsStr = errors.map{($0.message ?? "nil message")}.joined(separator: ", ")
                NSLog("server side error(s): \(errorsStr)")
                delegate.handleAPI(error: "server side error(s): \(errorsStr)")
                return false
            }
            NSLog("result was success, errors was nil")
            delegate.handleAPI(error: "result was success, errors was nil")
            return false
        case .failure(let error):
            if let nsError = error as NSError? {
                NSLog("error encountered: \(nsError.localizedDescription)")
                delegate.handleAPI(error: nsError.localizedDescription)
                return false
            }
            if ((error as? GameRankrAuthenticationError) != nil) {
                NSLog("authentication error - signing user out")
                handleLogout()
                delegate.handleAPIAuthenticationError()
                return false
            }
            if let graphqlError = error as? GraphQLHTTPResponseError {
                if (graphqlError.response.statusCode == 500) {
                    NSLog("Unexpected response from server.  This error has been logged and will be followed up on.")
                    delegate.handleAPI(error: "Unexpected response from server.  This error has been logged and will be followed up on.")
                    return false
                }
            }
            NSLog("data was nil, error: \(String(describing: error))")
            delegate.handleAPI(error: "data was nil, error: \(String(describing: error))")
            return false
        }
    }
}
