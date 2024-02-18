import Foundation
import UIKit
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
    func handleAPISearch(results: [Api.GameBasic], nextPage: GraphQLNullable<String>)
}

protocol APIGameDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(gameDetail: Api.GameQuery.Data.Game, rankings: [Api.RankingWithUser], friendRankings: [Api.RankingWithUser], nextPage: GraphQLNullable<String>)
}


protocol APIUserDetailDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(userDetail: Api.UserDetail, rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>)
}

protocol APIShelfDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>)
}

protocol APIUpdatesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(updates: [Api.RankingFull], nextPage: GraphQLNullable<String>)
}

protocol APIShelvesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(shelves: [Api.MyShelvesQuery.Data.Shelf])
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
    public internal(set) var currentUserId: Api.ID?
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
    
    
    func search(query: String, after: GraphQLNullable<String> = nil, delegate: APISearchResultsDelegate) -> Cancellable {
        return apollo.fetch(query: Api.SearchQuery(query: query, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let games = data.search
            var nextPage = GraphQLNullable<String>.none
            if (games.pageInfo.hasNextPage){
                if let cursor = games.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let results = games.edges!.map{$0!.game!.fragments.gameBasic}
            delegate.handleAPISearch(results: results, nextPage: nextPage)
        }
    }
    
    func gameDetail(id: Api.ID, delegate: APIGameDetailDelegate) {
        apollo.fetch(query: Api.GameQuery(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let game = data.game
            let rankingEdges = game.rankings
            
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = rankingEdges.edges!.map{$0!.node!.fragments.rankingWithUser}
            let friendRankings = game.friend_rankings.map{$0.fragments.rankingWithUser}
            delegate.handleAPI(gameDetail: game, rankings: rankings, friendRankings: friendRankings, nextPage: nextPage)
        }
    }
    
    func shelf(id: Api.ID, after: GraphQLNullable<String> = nil, delegate: APIShelfDelegate) {
        apollo.fetch(query: Api.ShelfQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data.shelf.rankings
            
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func userDetail(id: Api.ID, delegate: APIUserDetailDelegate) {
        apollo.fetch(query: Api.UserQuery(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let user = data.user
            let rankingEdges = user.fragments.userDetail.rankings
            
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }

    func me(delegate: APIUserDetailDelegate) {
        apollo.fetch(query: Api.MeQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let user = data.user
            let rankingEdges = user.fragments.userDetail.rankings
            
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(userDetail: user.fragments.userDetail, rankings: rankings, nextPage: nextPage)
        }
    }
    
    func myShelves(delegate: APIShelvesDelegate) {
        apollo.fetch(query: Api.MyShelvesQuery(), cachePolicy: .fetchIgnoringCacheData) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPI(shelves: data.shelves)
        }
    }
    
    func updates(after: GraphQLNullable<String> = nil, delegate: APIUpdatesDelegate) {
        
        apollo.fetch(query: Api.UpdatesQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let updates = data.updates
            
            var nextPage = GraphQLNullable<String>.none
            if (updates.pageInfo.hasNextPage){
                if let cursor = updates.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
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
    var id: String = "GameRankrAuthInterceptor"
    
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        if (api.token != nil) {
            request.addHeader(name: "api-token", value: api.token!)
        }
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}

class GameRankrResponseInterceptor : ApolloInterceptor {
    var id: String = "GameRankrResponseInterceptor"
    
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
