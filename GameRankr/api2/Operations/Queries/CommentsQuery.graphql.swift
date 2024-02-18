// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class CommentsQuery: GraphQLQuery {
    static let operationName: String = "Comments"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Comments($resourceId: ID!, $resourceType: String!, $after: String) { comments( resource_id: $resourceId resource_type: $resourceType first: 30 after: $after ) { __typename edges { __typename comment: node { __typename ...CommentBasic } } pageInfo { __typename endCursor hasNextPage } } }"#,
        fragments: [CommentBasic.self, UserBasic.self]
      ))

    public var resourceId: ID
    public var resourceType: String
    public var after: GraphQLNullable<String>

    public init(
      resourceId: ID,
      resourceType: String,
      after: GraphQLNullable<String>
    ) {
      self.resourceId = resourceId
      self.resourceType = resourceType
      self.after = after
    }

    public var __variables: Variables? { [
      "resourceId": resourceId,
      "resourceType": resourceType,
      "after": after
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("comments", Comments.self, arguments: [
          "resource_id": .variable("resourceId"),
          "resource_type": .variable("resourceType"),
          "first": 30,
          "after": .variable("after")
        ]),
      ] }

      var comments: Comments { __data["comments"] }

      /// Comments
      ///
      /// Parent Type: `CommentConnection`
      struct Comments: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.CommentConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo.self),
        ] }

        /// A list of edges.
        var edges: [Edge?]? { __data["edges"] }
        /// Information to aid in pagination.
        var pageInfo: PageInfo { __data["pageInfo"] }

        /// Comments.Edge
        ///
        /// Parent Type: `CommentEdge`
        struct Edge: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.CommentEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", alias: "comment", Comment?.self),
          ] }

          /// The item at the end of the edge.
          var comment: Comment? { __data["comment"] }

          /// Comments.Edge.Comment
          ///
          /// Parent Type: `Comment`
          struct Comment: Api.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { Api.Objects.Comment }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(CommentBasic.self),
            ] }

            var id: Api.ID { __data["id"] }
            var comment: String { __data["comment"] }
            var created_at: String { __data["created_at"] }
            var user: User { __data["user"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var commentBasic: CommentBasic { _toFragment() }
            }

            /// Comments.Edge.Comment.User
            ///
            /// Parent Type: `User`
            struct User: Api.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { Api.Objects.User }

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
        }

        /// Comments.PageInfo
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