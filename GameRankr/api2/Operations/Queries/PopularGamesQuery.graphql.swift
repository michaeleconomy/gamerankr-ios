// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class PopularGamesQuery: GraphQLQuery {
    static let operationName: String = "PopularGames"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query PopularGames { games: popular_games { __typename ...GameBasic } }"#,
        fragments: [GameBasic.self]
      ))

    public init() {}

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("popular_games", alias: "games", [Game].self),
      ] }

      var games: [Game] { __data["games"] }

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
    }
  }

}