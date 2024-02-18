// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct RankingWithUser: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment RankingWithUser on Ranking { __typename ...RankingBasic user { __typename ...UserBasic } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Ranking }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("user", User?.self),
      .fragment(RankingBasic.self),
    ] }

    var user: User? { __data["user"] }
    var id: Api.ID { __data["id"] }
    var ranking: Int? { __data["ranking"] }
    var review: String? { __data["review"] }
    var verb: String { __data["verb"] }
    var comments_count: Int { __data["comments_count"] }
    var url: String { __data["url"] }
    var updated_at: String { __data["updated_at"] }
    var shelves: [Shelf] { __data["shelves"] }
    var port: Port? { __data["port"] }

    struct Fragments: FragmentContainer {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      var rankingBasic: RankingBasic { _toFragment() }
    }

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

    /// Shelf
    ///
    /// Parent Type: `Shelf`
    struct Shelf: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Shelf }

      var id: Api.ID { __data["id"] }
      var name: String { __data["name"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var shelfBasic: ShelfBasic { _toFragment() }
      }
    }

    typealias Port = RankingBasic.Port
  }

}