import Foundation

protocol APIRecentReviewsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingFull], nextPage: String?)
}
protocol APIPopularGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(games: [GameBasic])
}

extension GameRankrAPI {
    
    func recentReviews(after: String? = nil, delegate: APIRecentReviewsDelegate) {
        apollo.fetch(query: RecentReviewsQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let rankingEdges = data!.recentReviews
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            delegate.handleAPI(rankings: rankingEdges.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
        }
    }
    
    func popularGames(delegate: APIPopularGamesDelegate) {
        apollo.fetch(query: PopularGamesQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let games = data!.games
            delegate.handleAPI(games: games.map{$0.fragments.gameBasic})
        }
    }
}
