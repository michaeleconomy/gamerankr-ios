
import Foundation
import Apollo

protocol APIFlagDelegate: AuthenticatedAPIErrorDelegate {
    func handleAPIFlaggedSuccessfully()
}
extension GameRankrAPI {
    
    func flag(resourceId: GraphQLID?, resourceType: String?, text: String, delegate: APIFlagDelegate) {
        apollo.perform(mutation: FlagMutation(resourceId: resourceId, resourceType: resourceType, text: text) ) { (result, error) in
            if (!self.handleApolloApiErrors(result, error, delegate: delegate)) { return }
            if (!result!.data!.flag) {
                delegate.handleAPI(error: "Could not flag item for unknown reason")
                return
            }
            delegate.handleAPIFlaggedSuccessfully()
        }
    }
}
