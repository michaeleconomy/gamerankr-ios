// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct RankingBasic: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment RankingBasic on Ranking { __typename id ranking review verb comments_count url updated_at shelves { __typename ...ShelfBasic } port { __typename id platform { __typename id name shortName } small_image_url medium_image_url } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Ranking }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Api.ID.self),
      .field("ranking", Int?.self),
      .field("review", String?.self),
      .field("verb", String.self),
      .field("comments_count", Int.self),
      .field("url", String.self),
      .field("updated_at", String.self),
      .field("shelves", [Shelf].self),
      .field("port", Port?.self),
    ] }

    var id: Api.ID { __data["id"] }
    var ranking: Int? { __data["ranking"] }
    var review: String? { __data["review"] }
    var verb: String { __data["verb"] }
    var comments_count: Int { __data["comments_count"] }
    var url: String { __data["url"] }
    var updated_at: String { __data["updated_at"] }
    var shelves: [Shelf] { __data["shelves"] }
    var port: Port? { __data["port"] }

    /// Shelf
    ///
    /// Parent Type: `Shelf`
    struct Shelf: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Shelf }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(ShelfBasic.self),
      ] }

      var id: Api.ID { __data["id"] }
      var name: String { __data["name"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var shelfBasic: ShelfBasic { _toFragment() }
      }
    }

    /// Port
    ///
    /// Parent Type: `Port`
    struct Port: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Port }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Api.ID.self),
        .field("platform", Platform.self),
        .field("small_image_url", String?.self),
        .field("medium_image_url", String?.self),
      ] }

      var id: Api.ID { __data["id"] }
      var platform: Platform { __data["platform"] }
      var small_image_url: String? { __data["small_image_url"] }
      var medium_image_url: String? { __data["medium_image_url"] }

      /// Port.Platform
      ///
      /// Parent Type: `Platform`
      struct Platform: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.Platform }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Api.ID.self),
          .field("name", String.self),
          .field("shortName", String.self),
        ] }

        var id: Api.ID { __data["id"] }
        var name: String { __data["name"] }
        var shortName: String { __data["shortName"] }
      }
    }
  }

}