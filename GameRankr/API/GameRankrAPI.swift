import Foundation
import Apollo

let api = GameRankrAPI()

protocol APIErrorDelegate {
    func handleAPI(error: String)
}
protocol APIGenericSuccessDelegate : APIErrorDelegate {
    func handleAPISuccess()
}
protocol AuthenticatedAPIErrorDelegate : APIErrorDelegate {
    func handleAPIAuthenticationError()
}

extension AuthenticatedAPIErrorDelegate where Self: UIViewController {
    func handleAPIAuthenticationError() {
        easyAlert("Authentication Error.  Signed out.")
    }
}

protocol APISearchResultsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPISearch(results: [GameBasic], nextPage: String?)
}

protocol APIGameDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(gameDetail: GameQuery.Data.Game, rankings: [RankingWithUser], friendRankings: [RankingWithUser], nextPage: String?)
}


protocol APIUserDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(userDetail: UserDetail, rankings: [RankingWithGame], nextPage: String?)
}

protocol APIShelfDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIUpdatesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(updates: [RankingFull], nextPage: String?)
}

protocol APIShelvesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf])
}

class GameRankrAPI {
    
    public internal(set) var signedIn = false
    public internal(set) var email: String = ""
    internal var password: String = ""
    var signedOut: Bool {
        get {
            return !signedIn
        }
    }
    
//    let base_url = "http://192.168.86.27:3000" // localhost
    let base_url = "https://www.gamerankr.com"
    internal var authDelegates = [APIAuthenticationDelegate]()
    public internal(set) var token: String?
    public internal(set) var currentUserId: GraphQLID?
    private(set) var apollo: ApolloClient
    init() {
        let token = LocalSQLiteManager.sharedInstance.getMisc(key: "token")
        let currentUserId = LocalSQLiteManager.sharedInstance.getMisc(key: "currentUserId")
        NSLog("token: " + (token ?? "nil"))
        NSLog("currentUserId: " + (currentUserId ?? "nil"))
        
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
        let url = URL(string: base_url + "/graphql")!
        
        let cache = InMemoryNormalizedCache()
        
        let store = ApolloStore(cache: cache)
        let interceptorProvider = GameRankrInterceptorProvider(store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvider, endpointURL: url)
        apollo = ApolloClient(networkTransport: networkTransport, store: store)
        
    }
    
    
    func search(query: String, after: String? = nil, delegate: APISearchResultsDelegate) -> Cancellable {
        return apollo.fetch(query: SearchQuery(query: query, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let games = data.search
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
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let game = data.game
            let rankingEdges = game.rankings
            
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage == true){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.node!.fragments.rankingWithUser}
            let friendRankings = game.friendRankings.map{$0.fragments.rankingWithUser}
            delegate.handleAPI(gameDetail: game, rankings: rankings, friendRankings: friendRankings, nextPage: nextPage)
        }
    }
    
    func shelf(id: GraphQLID, after: String? = nil, delegate: APIShelfDelegate) {
        apollo.fetch(query: ShelfQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let rankingEdges = data.shelf.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage == true) {
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
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let user = data.user
            let rankingEdges = user.fragments.userDetail.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage == true){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }

    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: MeQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let user = data.user
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
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            delegate.handleAPI(shelves: data.shelves)
        }
    }
    
    func updates(after: String? = nil, delegate: APIUpdatesDelegate) {
        apollo.fetch(query: UpdatesQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let updates = data.updates
            var nextPage : String?
            if (updates.pageInfo.hasNextPage){
                nextPage = updates.pageInfo.endCursor
            }
            delegate.handleAPI(updates: updates.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
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
            if ((error as? GameRankrAuthenticationError) != nil) {
                NSLog("GameRankrAuthenticationError")
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
            if let nsError = error as NSError? {
                if (nsError.code == NSURLErrorCancelled) {
                    //api call cancelled - ignoring
                    return false
                }
                NSLog("error encountered: \(nsError.localizedDescription)")
                delegate.handleAPI(error: nsError.localizedDescription)
                return false
            }
            NSLog("data was nil, error: \(String(describing: error))")
            delegate.handleAPI(error: "data was nil, error: \(String(describing: error))")
            return false
        }
    }
}

class GameRankrAuthInterceptor : ApolloInterceptor {
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        if (api.token != nil) {
            request.addHeader(name: "api-token", value: api.token!)
        }
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}

class GameRankrResponseInterceptor : ApolloInterceptor {
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        guard let httpResponse = response?.httpResponse else {
            fatalError("Response should be an HTTPURLResponse")
        }
        guard let data = response?.rawData else {
            chain.handleErrorAsync(GraphQLHTTPResponseError(body: response?.rawData, response: httpResponse, kind: .invalidResponse), request: request, response: response, completion: completion)
            return
        }
        
        NSLog("data: \(String(data: data, encoding: .utf8) ?? "nil")")
        NSLog("http status: \(httpResponse.statusCode)")
        if (httpResponse.statusCode == 401) {
            NSLog("foo")
            chain.handleErrorAsync(GameRankrAuthenticationError(), request: request, response: response, completion: completion)
            return
        }
        if (httpResponse.statusCode != 200) {
            chain.handleErrorAsync(GraphQLHTTPResponseError(body: response?.rawData, response: httpResponse, kind: .errorResponse), request: request, response: response, completion: completion)
            return
        }
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}

class GameRankrInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(GameRankrAuthInterceptor(), at: 0)
        interceptors.insert(GameRankrResponseInterceptor(), at: 4)
        return interceptors
    }
}
