import Foundation
import Apollo

let api = GamerankrAPI()

protocol APIErrorDelegate {
    func handleAPI(error: String)
}
protocol AuthenticatedAPIErrorDelegate : APIErrorDelegate {
    func handleAPIAuthenticationError()
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

protocol APIDestroyCommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPICommentDestruction(ranking: CommentBasic)
}

protocol APIShelvesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf])
}

protocol APICommentsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comments: [CommentBasic], nextPage: String?)
}

protocol APICommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comment: CommentBasic)
}

protocol APILoginDelegate: APIErrorDelegate {
    func handleAPILogin()
}

protocol APIAuthenticationDelegate {
    func handleAPILogin()
    func handleAPILogout()
}

class GamerankrAPI {
    
    public private(set) var signedIn = false
    var signedOut: Bool {
        get {
            return !signedIn
        }
    }
    
//    let base_url = "http://localhost:3000"
    let base_url = "https://www.gamerankr.com"
    private let apollo: ApolloClient
    private var authDelegates = [APIAuthenticationDelegate]()
    public private(set) var token: String?
    public private(set) var currentUserId: GraphQLID?
    
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
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: String]
                self.handleLogin(currentUserId: json["current_user_id"]!,token: json["token"]!)
            }
            catch {
                delegate.handleAPI(error: "parse error on login")
                return
            }
            
            delegate.handleAPILogin()
        }
        task.resume()
    }
    
    private func handleLogin(currentUserId: GraphQLID, token: String) {
        NSLog("login was successful.")
        self.signedIn = true
        self.token = token
        self.currentUserId = currentUserId
        LocalSQLiteManager.sharedInstance.putMisc(key: "token", value: token)
        LocalSQLiteManager.sharedInstance.putMisc(key: "currentUserId", value: currentUserId)
        
        MyGamesManager.sharedInstance.load()
        for authDelegate in authDelegates {
            authDelegate.handleAPILogin()
        }
    }
    
    private func handleLogout() {
        self.signedIn = false
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
            let rankings = rankingEdges.edges!.map{$0!.node!.fragments.rankingWithUser}
            let friendRankings = game.friendRankings.map{$0.fragments.rankingWithUser}
            delegate.handleAPI(gameDetail: game, rankings: rankings, friendRankings: friendRankings, nextPage: nextPage)
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
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithUser}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func shelf(id: GraphQLID, after: String? = nil, delegate: APIShelfDelegate) {
        apollo.fetch(query: ShelfQuery(id: id, after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let rankingEdges = result!.data!.shelf.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage) {
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
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
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }

    func userRankings(id: String, after: String? = nil, delegate: APIUserRankingsDelegate) {
        apollo.fetch(query: UserRankingsQuery(id: id, after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let rankingEdges = result!.data!.user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
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
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }
    
    func myShelves(delegate: APIShelvesDelegate) {
        apollo.fetch(query: MyShelvesQuery(), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(shelves: result!.data!.shelves)
        }
    }
    
    func myGames(after: String? = nil, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: MyGamesQuery(after: after), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let myGames = result!.data!.myGames
            
            var nextPage : String?
            if (myGames.pageInfo.hasNextPage){
                nextPage = myGames.pageInfo.endCursor
            }
            let rankings = myGames.edges!.map{$0!.ranking!.fragments.rankingWithGame}
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
            delegate.handleAPI(updates: updates.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
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
    
    func comments(resourceId: GraphQLID, resourceType: String, after: String? = nil, delegate: APICommentsDelegate) {
        
        apollo.fetch(query: CommentsQuery(resourceId: resourceId, resourceType: resourceType, after: after), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let comments = result!.data!.comments
            var nextPage : String?
            if (comments.pageInfo.hasNextPage){
                nextPage = comments.pageInfo.endCursor
            }
            delegate.handleAPI(comments: comments.edges!.map{$0!.comment!.fragments.commentBasic}, nextPage: nextPage)
        }
    }
    
    func rankPort(portId: GraphQLID, ranking: Int?, removeRanking: Bool, review: String?, addShelfId: GraphQLID?, removeShelfId: GraphQLID?, delegate: APIRankDelegate) {
        apollo.perform(mutation: RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(ranking: result!.data!.ranking.fragments.rankingWithGame)
        }
    }
    
    func destroyRanking(portId: GraphQLID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: DestroyRankingMutation(portId: portId)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPIRankingDestruction(ranking: result!.data!.ranking)
        }
    }
    
    func comment(resourceId: GraphQLID, resourceType: String, comment: String, delegate: APICommentDelegate) {
        
        apollo.perform(mutation: CommentMutation(resourceId: resourceId, resourceType: resourceType, comment: comment)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPI(comment: result!.data!.comment.fragments.commentBasic)
        }
    }
    
    func destroyComment(id: GraphQLID, delegate: APIDestroyCommentDelegate) {
        apollo.perform(mutation: DestroyCommentMutation(id: id)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            delegate.handleAPICommentDestruction(ranking: result!.data!.comment.fragments.commentBasic)
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
            if let nsError = error as NSError? {
                delegate.handleAPI(error: nsError.localizedDescription)
                return false
            }
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
