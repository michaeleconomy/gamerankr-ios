import Foundation
import Apollo

protocol APIFollowersDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(followers: [Api.UserBasic], nextPage: GraphQLNullable<String>)
}
protocol APIFollowingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(following: [Api.UserBasic], nextPage: GraphQLNullable<String>)
}
protocol APIMyFollowingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(following: [Api.ID])
}
protocol APIFollowDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(followed: Api.ID)
}
protocol APIUnfollowDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(unfollowed: Api.ID)
}

extension GameRankrAPI {
    func followers(userId: Api.ID, after: GraphQLNullable<String> = nil, delegate: APIFollowersDelegate) {
        apollo.fetch(query: Api.FollowersQuery(userId: userId, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let followers = data.user.followers
            var nextPage = GraphQLNullable<String>.none
            if (followers.pageInfo.hasNextPage){
                if let cursor = followers.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            delegate.handleAPI(followers: followers.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
        }
    }
    
    func following(userId: Api.ID, after: GraphQLNullable<String> = nil, delegate: APIFollowingDelegate) {
        apollo.fetch(query: Api.FollowingQuery(userId: userId, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            let followers = data.user.following
            var nextPage = GraphQLNullable<String>.none
            if (followers.pageInfo.hasNextPage){
                if let cursor = followers.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            delegate.handleAPI(following: followers.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
        }
    }
    
    func myFollowing(delegate: APIMyFollowingDelegate) {
        apollo.fetch(query: Api.MyFollowingQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            delegate.handleAPI(following: data.user.followingUserIds)
        }
    }
    
    func follow(id: Api.ID, delegate: APIFollowDelegate) {
        apollo.perform(mutation: Api.FollowMutation(userId: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            
            if (!data.follow) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPI(followed: id)
        }
    }
    
    func unfollow(id: Api.ID, delegate: APIUnfollowDelegate) {
        apollo.perform(mutation: Api.UnfollowMutation(userId: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }

            if (!data.unfollow) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPI(unfollowed: id)
        }
    }
    
}
