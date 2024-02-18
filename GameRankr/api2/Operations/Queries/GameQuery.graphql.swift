// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class GameQuery: GraphQLQuery {
    static let operationName: String = "Game"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Game($id: ID!) { game(id: $id) { __typename ...GameBasic ports { __typename id description } rankings(first: 30) { __typename edges { __typename node { __typename ...RankingWithUser } } pageInfo { __typename endCursor hasNextPage } } friend_rankings { __typename ...RankingWithUser } } }"#,
        fragments: [GameBasic.self, RankingBasic.self, RankingWithUser.self, ShelfBasic.self, UserBasic.self]
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

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
          .field("ports", [Port].self),
          .field("rankings", Rankings.self, arguments: ["first": 30]),
          .field("friend_rankings", [Friend_ranking].self),
          .fragment(GameBasic.self),
        ] }

        var ports: [Port] { __data["ports"] }
        var rankings: Rankings { __data["rankings"] }
        var friend_rankings: [Friend_ranking] { __data["friend_rankings"] }
        var id: Api.ID { __data["id"] }
        var title: String { __data["title"] }
        var url: String { __data["url"] }
        var initiallyReleasedAt: String? { __data["initiallyReleasedAt"] }
        var averageRanking: Double { __data["averageRanking"] }
        var rankingsCount: Int { __data["rankingsCount"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var gameBasic: GameBasic { _toFragment() }
        }

        /// Game.Port
        ///
        /// Parent Type: `Port`
        struct Port: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.Port }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Api.ID.self),
            .field("description", String?.self),
          ] }

          var id: Api.ID { __data["id"] }
          var description: String? { __data["description"] }
          var platform: Platform { __data["platform"] }
          var releasedAt: String? { __data["releasedAt"] }
          var averageRanking: Double { __data["averageRanking"] }
          var rankingsCount: Int { __data["rankingsCount"] }
          var small_image_url: String? { __data["small_image_url"] }
          var medium_image_url: String? { __data["medium_image_url"] }

          typealias Platform = GameBasic.Port.Platform
        }

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
              .field("node", Node?.self),
            ] }

            /// The item at the end of the edge.
            var node: Node? { __data["node"] }

            /// Game.Rankings.Edge.Node
            ///
            /// Parent Type: `Ranking`
            struct Node: Api.SelectionSet {
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

              /// Game.Rankings.Edge.Node.User
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

              /// Game.Rankings.Edge.Node.Shelf
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

        /// Game.Friend_ranking
        ///
        /// Parent Type: `Ranking`
        struct Friend_ranking: Api.SelectionSet {
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

          /// Game.Friend_ranking.User
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

          /// Game.Friend_ranking.Shelf
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

}