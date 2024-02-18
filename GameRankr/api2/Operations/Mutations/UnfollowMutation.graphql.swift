// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class UnfollowMutation: GraphQLMutation {
    static let operationName: String = "Unfollow"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Unfollow($userId: ID!) { unfollow(userId: $userId) }"#
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
        .field("unfollow", Bool.self, arguments: ["userId": .variable("userId")]),
      ] }

      var unfollow: Bool { __data["unfollow"] }
    }
  }

}