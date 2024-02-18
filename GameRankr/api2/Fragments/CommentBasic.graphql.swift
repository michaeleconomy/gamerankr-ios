// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct CommentBasic: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CommentBasic on Comment { __typename id comment created_at user { __typename ...UserBasic } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Comment }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Api.ID.self),
      .field("comment", String.self),
      .field("created_at", String.self),
      .field("user", User.self),
    ] }

    var id: Api.ID { __data["id"] }
    var comment: String { __data["comment"] }
    var created_at: String { __data["created_at"] }
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

}