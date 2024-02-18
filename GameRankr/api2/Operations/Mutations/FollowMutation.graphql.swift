// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class FollowMutation: GraphQLMutation {
    static let operationName: String = "Follow"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Follow($userId: ID!) { follow(userId: $userId) }"#
      ))

    public var userId: ID

    public init(userId: ID) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("follow", Bool.self, arguments: ["userId": .variable("userId")]),
      ] }

      var follow: Bool { __data["follow"] }
    }
  }

}