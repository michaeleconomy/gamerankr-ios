import Foundation
import Apollo

protocol APIFollowersDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(followers: [UserBasic], nextPage: String?)
}
protocol APIFollowingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(following: [UserBasic], nextPage: String?)
}
protocol APIMyFollowingDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(following: [GraphQLID])
}
protocol APIFollowDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(followed: GraphQLID)
}
protocol APIUnfollowDelegate : AuthenticatedAPIErrorDelegate {
    func handleAPI(unfollowed: GraphQLID)
}

extension GameRankrAPI {
    func followers(userId: GraphQLID, after: String? = nil, delegate: APIFollowersDelegate) {
        apollo.fetch(query: FollowersQuery(userId: userId, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let followers = data.user.followers
            var nextPage : String?
            if (followers.pageInfo.hasNextPage){
                nextPage = followers.pageInfo.endCursor
            }
            delegate.handleAPI(followers: followers.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
        }
    }
    
    func following(userId: GraphQLID, after: String? = nil, delegate: APIFollowingDelegate) {
        apollo.fetch(query: FollowingQuery(userId: userId, after: after)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            let followers = data.user.following
            var nextPage : String?
            if (followers.pageInfo.hasNextPage){
                nextPage = followers.pageInfo.endCursor
            }
            delegate.handleAPI(following: followers.edges!.map{$0!.user!.fragments.userBasic}, nextPage: nextPage)
        }
    }
    
    func myFollowing(delegate: APIMyFollowingDelegate) {
        apollo.fetch(query: MyFollowingQuery()) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else {return}
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            delegate.handleAPI(following: data.user.followingUserIds)
        }
    }
    
    func follow(id: GraphQLID, delegate: APIFollowDelegate) {
        apollo.perform(mutation: FollowMutation(userId: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            if (!data.follow) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPI(followed: id)
        }
    }
    
    func unfollow(id: GraphQLID, delegate: APIUnfollowDelegate) {
        apollo.perform(mutation: UnfollowMutation(userId: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            guard let data = data else {
                delegate.handleAPI(error: "Error getting data from result")
                return
            }
            if (!data.unfollow) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPI(unfollowed: id)
        }
    }
    
}
