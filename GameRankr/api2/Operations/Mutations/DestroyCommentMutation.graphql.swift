// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class DestroyCommentMutation: GraphQLMutation {
    static let operationName: String = "DestroyComment"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DestroyComment($id: ID!) { comment: destroy_comment(id: $id) { __typename ...CommentBasic } }"#,
        fragments: [CommentBasic.self, UserBasic.self]
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("destroy_comment", alias: "comment", Comment.self, arguments: ["id": .variable("id")]),
      ] }

      var comment: Comment { __data["comment"] }

      /// Comment
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

        /// Comment.User
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
  }

}