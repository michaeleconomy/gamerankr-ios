// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class GameRankingsQuery: GraphQLQuery {
    static let operationName: String = "GameRankings"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GameRankings($id: ID!, $after: String) { game(id: $id) { __typename rankings(first: 30, after: $after) { __typename edges { __typename ranking: node { __typename ...RankingWithUser } } pageInfo { __typename endCursor hasNextPage } } } }"#,
        fragments: [RankingBasic.self, RankingWithUser.self, ShelfBasic.self, UserBasic.self]
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
        .field("game", Game.self, arguments: ["id": .variable("id")]),
      ] }

      var game: Game { __data["game"] }

      /// Game
      ///
      /// Parent Type: `Game`
      struct Game: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.Game }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("rankings", Rankings.self, arguments: [
            "first": 30,
            "after": .variable("after")
          ]),
        ] }

        var rankings: Rankings { __data["rankings"] }

        /// Game.Rankings
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

          /// Game.Rankings.Edge
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

            /// Game.Rankings.Edge.Ranking
            ///
            /// Parent Type: `Ranking`
            struct Ranking: Api.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { Api.Objects.Ranking }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .fragment(RankingWithUser.self),
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

                var rankingWithUser: RankingWithUser { _toFragment() }
                var rankingBasic: RankingBasic { _toFragment() }
              }

              /// Game.Rankings.Edge.Ranking.User
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

              /// Game.Rankings.Edge.Ranking.Shelf
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

          /// Game.Rankings.PageInfo
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