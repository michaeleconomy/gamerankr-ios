import Foundation

protocol APIRecentReviewsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(rankings: [RankingFull], nextPage: String?)
}
protocol APIPopularGamesDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(games: [GameBasic])
}

extension GameRankrAPI {
    
    func recentReviews(after: String? = nil, delegate: APIRecentReviewsDelegate) {
        apollo.fetch(query: RecentReviewsQuery(after: after)) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let rankingEdges = result!.data!.recentReviews
            var nextPage : String?
            if (rankingEdges.pageInfo.hasNextPage){
                nextPage = rankingEdges.pageInfo.endCursor
            }
            delegate.handleAPI(rankings: rankingEdges.edges!.map{$0!.ranking!.fragments.rankingFull}, nextPage: nextPage)
        }
    }
    
    func popularGames(delegate: APIPopularGamesDelegate) {
        apollo.fetch(query: PopularGamesQuery()) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            let games = result!.data!.games
            delegate.handleAPI(games: games.map{$0.fragments.gameBasic})
        }
    }
}
