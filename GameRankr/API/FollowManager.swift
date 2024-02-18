import Foundation
import Apollo

protocol FollowChangeDelegate : AuthenticatedAPIErrorDelegate, AnyObject {
    func handleFollowUpdates()
}

class FollowManager : APIFollowDelegate, APIUnfollowDelegate, APIMyFollowingDelegate {
    func handleAPI(followed: Api.ID) {
        followingIds.insert(followed)
        delegates.forEach{$0.handleFollowUpdates()}
    }
    
    func handleAPI(unfollowed: Api.ID) {
        followingIds.remove(unfollowed)
        delegates.forEach{$0.handleFollowUpdates()}
    }
    
    func handleAPI(following: [Api.ID]) {
        followingIds.removeAll()
        for id in following {
            followingIds.insert(id)
        }
        delegates.forEach{$0.handleFollowUpdates()}
    }
    
    func handleAPIAuthenticationError() {
        for delegate in delegates {
            delegate.handleAPIAuthenticationError()
        }
    }
    
    func handleAPI(error: String) {
        delegates.forEach{$0.handleAPI(error: error)}
    }
    
    
    
    static let sharedInstance = FollowManager()
    
    private var followingIds: Set<Api.ID> = []
    
    private var delegates = [FollowChangeDelegate]()
    
    init() {
        if (api.signedIn) {
            load()
        }
    }
    
    private func load() {
        api.myFollowing(delegate: self)
    }
    
    func subscribe(delegate: FollowChangeDelegate) {
        delegates.append(delegate)
    }
    
    func unsubscribe(delegate: FollowChangeDelegate) {
        if let index = delegates.firstIndex(where: {$0 === delegate}) {
            delegates.remove(at: index)
        }
    }
    
    func following(id: Api.ID) -> Bool {
        return followingIds.contains(id)
    }
    
    func follow(id: Api.ID) {
        api.follow(id: id, delegate: self)
    }
    
    func unfollow(id: Api.ID) {
        api.unfollow(id: id, delegate: self)
    }
}
