import Foundation

protocol APIPlatformsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(platforms: [PlatformBasic], nextPage: String?)
}

extension GameRankrAPI {
    
    func platforms(after: String? = nil, delegate: APIPlatformsDelegate) {
        apollo.fetch(query: PlatformsQuery(after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            let platformEdges = data!.platforms
            var nextPage : String?
            if (platformEdges.pageInfo.hasNextPage){
                nextPage = platformEdges.pageInfo.endCursor
            }
            delegate.handleAPI(platforms: platformEdges.edges!.map{$0!.platform!.fragments.platformBasic}, nextPage: nextPage)
        }
    }
    
    func featuredPlatforms(delegate: APIPlatformsDelegate) {
        apollo.fetch(query: FeaturedPlatformsQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            let platforms = data!.platforms
            delegate.handleAPI(platforms: platforms.map{$0.fragments.platformBasic}, nextPage: nil)
        }
    }
}

