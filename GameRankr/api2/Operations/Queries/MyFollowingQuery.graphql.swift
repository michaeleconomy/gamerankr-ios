// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class MyFollowingQuery: GraphQLQuery {
    static let operationName: String = "MyFollowing"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyFollowing { user: me { __typename followingUserIds } }"#
      ))

    public init() {}

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("me", alias: "user", User.self),
      ] }

      var user: User { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      struct User: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("followingUserIds", [Api.ID].self),
        ] }

        var followingUserIds: [Api.ID] { __data["followingUserIds"] }
      }
    }
  }

}