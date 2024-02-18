// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class RankPortMutation: GraphQLMutation {
    static let operationName: String = "RankPort"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RankPort($portId: ID!, $ranking: Int, $removeRanking: Boolean, $review: String, $addShelfId: ID, $removeShelfId: ID) { ranking: rank_port( port_id: $portId ranking: $ranking remove_ranking: $removeRanking review: $review add_shelf_id: $addShelfId remove_shelf_id: $removeShelfId ) { __typename ...RankingWithGame } }"#,
        fragments: [GameBasic.self, RankingBasic.self, RankingWithGame.self, ShelfBasic.self]
      ))

    public var portId: ID
    public var ranking: GraphQLNullable<Int>
    public var removeRanking: GraphQLNullable<Bool>
    public var review: GraphQLNullable<String>
    public var addShelfId: GraphQLNullable<ID>
    public var removeShelfId: GraphQLNullable<ID>

    public init(
      portId: ID,
      ranking: GraphQLNullable<Int>,
      removeRanking: GraphQLNullable<Bool>,
      review: GraphQLNullable<String>,
      addShelfId: GraphQLNullable<ID>,
      removeShelfId: GraphQLNullable<ID>
    ) {
      self.portId = portId
      self.ranking = ranking
      self.removeRanking = removeRanking
      self.review = review
      self.addShelfId = addShelfId
      self.removeShelfId = removeShelfId
    }

    public var __variables: Variables? { [
      "portId": portId,
      "ranking": ranking,
      "removeRanking": removeRanking,
      "review": review,
      "addShelfId": addShelfId,
      "removeShelfId": removeShelfId
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("rank_port", alias: "ranking", Ranking.self, arguments: [
          "port_id": .variable("portId"),
          "ranking": .variable("ranking"),
          "remove_ranking": .variable("removeRanking"),
          "review": .variable("review"),
          "add_shelf_id": .variable("addShelfId"),
          "remove_shelf_id": .variable("removeShelfId")
        ]),
      ] }

      var ranking: Ranking { __data["ranking"] }

      /// Ranking
      ///
      /// Parent Type: `Ranking`
      struct Ranking: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.Ranking }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(RankingWithGame.self),
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

          var rankingWithGame: RankingWithGame { _toFragment() }
          var rankingBasic: RankingBasic { _toFragment() }
        }

        /// Ranking.Game
        ///
        /// Parent Type: `Game`
        struct Game: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.Game }

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

        /// Ranking.Shelf
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
  }

}