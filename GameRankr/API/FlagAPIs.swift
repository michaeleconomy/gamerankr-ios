
import Foundation
import Apollo

protocol APIFlagDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIFlaggedSuccessfully()
}
extension GameRankrAPI {
    
    func flag(resourceId: Api.ID, resourceType: String, text: String, delegate: APIFlagDelegate) {
        apollo.perform(mutation: Api.FlagMutation(resourceId: resourceId, resourceType: resourceType, text: GraphQLNullable<String>.some(text)) ) { (result) in
            if (!self.handleApolloApiErrors(result, delegate: delegate)) { return }
            guard let data = try? result.get().data else { return }
            if (!data.flag) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPIFlaggedSuccessfully()
        }
    }
}
