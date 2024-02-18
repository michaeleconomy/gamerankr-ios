import Foundation

protocol APIRecentReviewsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [Api.RankingFull], nextPage: GraphQLNullable<String>)
}
protocol APIPopularGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(games: [Api.GameBasic])
}

extension GameRankrAPI {
    
    func recentReviews(after: GraphQLNullable<String> = nil, delegate: APIRecentReviewsDelegate) {
        apollo.fetch(query: Api.RecentReviewsQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data.recent_reviews
            var nextPage = GraphQLNullable<String>.none
            if (rankingEdges.pageInfo.hasNextPage){
                if let cursor = rankingEdges.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            delegate.handleAPI(rankings: rankingEdges.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
        }
    }
    
    func popularGames(delegate: APIPopularGamesDelegate) {
        apollo.fetch(query: Api.PopularGamesQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let games = data.games
            delegate.handleAPI(games: games.map{$0.fragments.gameBasic})
        }
    }
}
