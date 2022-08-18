import Foundation
import Apollo


protocol APIRankDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(ranking: RankingWithGame)
}

protocol APIDestroyRankingDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking)
}

protocol APIUserRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIMyGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIMyGames(rankings: [RankingWithGame], nextPage: String?)
}

protocol APIGameRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingWithUser], nextPage: String?)
}

extension GameRankrAPI {
    
    func myGames(after: String? = nil, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: MyGamesQuery(after: after), cachePolicy: .fetchIgnoringCacheData) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let myGames = data.myGames
            
            var nextPage : String?
            if (myGames.pageInfo.hasNextPage){
                nextPage = myGames.pageInfo.endCursor
            }
            let rankings = myGames.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPIMyGames(rankings: rankings, nextPage: nextPage)
        }
    }
    
    
    func gameRankings(id: GraphQLID, after: String? = nil, delegate: APIGameRankingsDelegate) {
        apollo.fetch(query: GameRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let rankingEdges = data.game.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage == true){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithUser}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func userRankings(id: String, after: String? = nil, delegate: APIUserRankingsDelegate) {
        apollo.fetch(query: UserRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let rankingEdges = data.user.rankings
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    
    // - mutations
    func rankPort(portId: GraphQLID, ranking: Int?, removeRanking: Bool, review: String?, addShelfId: GraphQLID?, removeShelfId: GraphQLID?, delegate: APIRankDelegate) {
        apollo.perform(mutation: RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            delegate.handleAPI(ranking: data.ranking.fragments.rankingWithGame)
        }
    }
    
    func destroyRanking(portId: GraphQLID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: DestroyRankingMutation(portId: portId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            delegate.handleAPIRankingDestruction(ranking: data.ranking)
        }
    }
}
