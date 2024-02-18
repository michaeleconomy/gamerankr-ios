import Foundation
import Apollo


protocol APIRankDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(ranking: Api.RankingWithGame)
}

protocol APIDestroyRankingDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIRankingDestruction(ranking: Api.DestroyRankingMutation.Data.Ranking)
}

protocol APIUserRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>)
}

protocol APIMyGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIMyGames(rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>)
}

protocol APIGameRankingsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [Api.RankingWithUser], nextPage: GraphQLNullable<String>)
}

extension GameRankrAPI {
    
    func myGames(after: GraphQLNullable<String> = .none, delegate: APIMyGamesDelegate) {
        apollo.fetch(query: Api.MyGamesQuery(after: after), cachePolicy: .fetchIgnoringCacheData) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
 
            let myGames = data.my_games
            
            var nextPage = GraphQLNullable<String>.none
            if (myGames.pageInfo.hasNextPage){
                if let cursor = myGames.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = myGames.edges!.map{$0!.ranking!.fragments.rankingWithGame}
            delegate.handleAPIMyGames(rankings: rankings, nextPage: nextPage)
        }
    }
    
    
    func gameRankings(id: Api.ID, after: GraphQLNullable<String> = .none, delegate: APIGameRankingsDelegate) {
        apollo.fetch(query: Api.GameRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data.game.rankings
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            let rankings = rankingEdges.edges!.map{$0!.ranking!.fragments.rankingWithUser}
            delegate.handleAPI(rankings: rankings, nextPage: nextPage)
        }
    }
    
    func userRankings(id: Api.ID, after: GraphQLNullable<String> = nil, delegate: APIUserRankingsDelegate) {
        apollo.fetch(query: Api.UserRankingsQuery(id: id, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data.user.rankings
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
    
    
    // - mutations
    func rankPort(portId: Api.ID, ranking: GraphQLNullable<Int>, removeRanking: GraphQLNullable<Bool>, review: GraphQLNullable<String>, addShelfId: GraphQLNullable<Api.ID>, removeShelfId: GraphQLNullable<Api.ID>, delegate: APIRankDelegate) {
        apollo.perform(mutation: Api.RankPortMutation(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPI(ranking: data.ranking.fragments.rankingWithGame)
        }
    }
    
    func destroyRanking(portId: Api.ID, delegate: APIDestroyRankingDelegate) {
        apollo.perform(mutation: Api.DestroyRankingMutation(portId: portId)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPIRankingDestruction(ranking: data.ranking)
        }
    }
}
