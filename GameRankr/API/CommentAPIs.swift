import Foundation
import Apollo

protocol APIDestroyCommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPICommentDestruction(ranking: Api.CommentBasic)
}
protocol APICommentsDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comments: [Api.CommentBasic], nextPage: GraphQLNullable<String>)
}

protocol APICommentDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPI(comment: Api.CommentBasic)
}

extension GameRankrAPI {
    func comments(resourceId: Api.ID, resourceType: String, after:  GraphQLNullable<String> = nil, delegate: APICommentsDelegate) {
        apollo.fetch(query: Api.CommentsQuery(resourceId: resourceId, resourceType: resourceType, after: after), cachePolicy: .fetchIgnoringCacheData) { (result) in
            
            
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            
            let comments = data.comments;
            
            var nextPage = GraphQLNullable<String>.none
            if (comments.pageInfo.hasNextPage){
                if let cursor = comments.pageInfo.endCursor {
                    nextPage = .some(cursor)
                }
            }
            delegate.handleAPI(comments: comments.edges!.map{$0!.comment!.fragments.commentBasic}, nextPage: nextPage)
        }
    }
    
    func comment(resourceId: Api.ID, resourceType: String, comment: String, delegate: APICommentDelegate) {
        
        apollo.perform(mutation: Api.CommentMutation(resourceId: resourceId, resourceType: resourceType, comment: comment)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            delegate.handleAPI(comment: data.comment.fragments.commentBasic)
        }
    }
    
    func destroyComment(id: Api.ID, delegate: APIDestroyCommentDelegate) {
        apollo.perform(mutation: Api.DestroyCommentMutation(id: id)) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            delegate.handleAPICommentDestruction(ranking: data.comment.fragments.commentBasic)
        }
    }
}
