import Foundation
import Apollo

protocol APIDestroyCommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPICommentDestruction(ranking: CommentBasic)
}
protocol APICommentsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comments: [CommentBasic], nextPage: String?)
}

protocol APICommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comment: CommentBasic)
}

extension GameRankrAPI {
    func comments(resourceId: GraphQLID, resourceType: String, after: String? = nil, delegate: APICommentsDelegate) {
        apollo.fetch(query: CommentsQuery(resourceId: resourceId, resourceType: resourceType, after: after), cachePolicy: .fetchIgnoringCacheData) { (result) in
            
            
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            
            let comments = data!.comments;

            var nextPage : String?
            if (comments.pageInfo.hasNextPage){
                nextPage = comments.pageInfo.endCursor
            }
            delegate.handleAPI(comments: comments.edges!.map{$0!.comment!.fragments.commentBasic}, nextPage: nextPage)
        }
    }
    
    func comment(resourceId: GraphQLID, resourceType: String, comment: String, delegate: APICommentDelegate) {
        
        apollo.perform(mutation: CommentMutation(resourceId: resourceId, resourceType: resourceType, comment: comment)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            delegate.handleAPI(comment: data!.comment.fragments.commentBasic)
        }
    }
    
    func destroyComment(id: GraphQLID, delegate: APIDestroyCommentDelegate) {
        apollo.perform(mutation: DestroyCommentMutation(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            delegate.handleAPICommentDestruction(ranking: data!.comment.fragments.commentBasic)
        }
    }
}
