// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct RankingWithGame: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment RankingWithGame on Ranking { __typename ...RankingBasic game { __typename ...GameBasic } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Ranking }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("game", Game?.self),
      .fragment(RankingBasic.self),
    ] }

    var game: Game? { __data["game"] }
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

    /// Game
    ///
    /// Parent Type: `Game`
    struct Game: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Game }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(GameBasic.self),
      ] }

      var id: Api.ID { __data["id"] }
      var title: String { __data["title"] }
      var url: String { __data["url"] }
      var initiallyReleasedAt: String? { __data["initiallyReleasedAt"] }
      var averageRanking: Double { __data["averageRanking"] }
      var rankingsCount: Int { __data["rankingsCount"] }
      var ports: [Port] { __data["ports"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var gameBasic: GameBasic { _toFragment() }
      }

      typealias Port = GameBasic.Port
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