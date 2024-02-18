// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class FollowingQuery: GraphQLQuery {
    static let operationName: String = "Following"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Following($userId: ID!, $after: String) { user(id: $userId) { __typename following(first: 30, after: $after) { __typename edges { __typename user: node { __typename ...UserBasic } } pageInfo { __typename endCursor hasNextPage } } } }"#,
        fragments: [UserBasic.self]
      ))

    public var userId: ID
    public var after: GraphQLNullable<String>

    public init(
      userId: ID,
      after: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.after = after
    }

    public var __variables: Variables? { [
      "userId": userId,
      "after": after
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("user", User.self, arguments: ["id": .variable("userId")]),
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
          .field("following", Following.self, arguments: [
            "first": 30,
            "after": .variable("after")
          ]),
        ] }

        var following: Following { __data["following"] }

        /// User.Following
        ///
        /// Parent Type: `UserConnection`
        struct Following: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.UserConnection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge?]?.self),
            .field("pageInfo", PageInfo.self),
          ] }

          /// A list of edges.
          var edges: [Edge?]? { __data["edges"] }
          /// Information to aid in pagination.
          var pageInfo: PageInfo { __data["pageInfo"] }

          /// User.Following.Edge
          ///
          /// Parent Type: `UserEdge`
          struct Edge: Api.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { Api.Objects.UserEdge }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("node", alias: "user", User?.self),
            ] }

            /// The item at the end of the edge.
            var user: User? { __data["user"] }

            /// User.Following.Edge.User
            ///
            /// Parent Type: `User`
            struct User: Api.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { Api.Objects.User }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .fragment(UserBasic.self),
              ] }

              var id: Api.ID { __data["id"] }
              var real_name: String { __data["real_name"] }
              var photo_url: String { __data["photo_url"] }

              struct Fragments: FragmentContainer {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                var userBasic: UserBasic { _toFragment() }
              }
            }
          }

          /// User.Following.PageInfo
          ///
          /// Parent Type: `PageInfo`
          struct PageInfo: Api.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { Api.Objects.PageInfo }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("endCursor", String?.self),
              .field("hasNextPage", Bool.self),
            ] }

            /// When paginating forwards, the cursor to continue.
            var endCursor: String? { __data["endCursor"] }
            /// When paginating forwards, are there more items?
            var hasNextPage: Bool { __data["hasNextPage"] }
          }
        }
      }
    }
  }

}