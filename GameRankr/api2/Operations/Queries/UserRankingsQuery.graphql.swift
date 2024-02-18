// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class UserRankingsQuery: GraphQLQuery {
    static let operationName: String = "UserRankings"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query UserRankings($id: ID!, $after: String) { user(id: $id) { __typename rankings(first: 30, after: $after) { __typename edges { __typename ranking: node { __typename ...RankingWithGame } } pageInfo { __typename endCursor hasNextPage } } } }"#,
        fragments: [GameBasic.self, RankingBasic.self, RankingWithGame.self, ShelfBasic.self]
      ))

    public var id: ID
    public var after: GraphQLNullable<String>

    public init(
      id: ID,
      after: GraphQLNullable<String>
    ) {
      self.id = id
      self.after = after
    }

    public var __variables: Variables? { [
      "id": id,
      "after": after
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("user", User.self, arguments: ["id": .variable("id")]),
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
          .field("rankings", Rankings.self, arguments: [
            "first": 30,
            "after": .variable("after")
          ]),
        ] }

        var rankings: Rankings { __data["rankings"] }

        /// User.Rankings
        ///
        /// Parent Type: `RankingConnection`
        struct Rankings: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.RankingConnection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge?]?.self),
            .field("pageInfo", PageInfo.self),
          ] }

          /// A list of edges.
          var edges: [Edge?]? { __data["edges"] }
          /// Information to aid in pagination.
          var pageInfo: PageInfo { __data["pageInfo"] }

          /// User.Rankings.Edge
          ///
          /// Parent Type: `RankingEdge`
          struct Edge: Api.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { Api.Objects.RankingEdge }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("node", alias: "ranking", Ranking?.self),
            ] }

            /// The item at the end of the edge.
            var ranking: Ranking? { __data["ranking"] }

            /// User.Rankings.Edge.Ranking
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

              /// User.Rankings.Edge.Ranking.Game
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

              /// User.Rankings.Edge.Ranking.Shelf
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

          /// User.Rankings.PageInfo
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