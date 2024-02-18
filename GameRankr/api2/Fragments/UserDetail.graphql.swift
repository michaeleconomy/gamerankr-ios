// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct UserDetail: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment UserDetail on User { __typename ...UserBasic rankingsCount followerCount followingCount rankings(first: 10) { __typename edges { __typename ranking: node { __typename ...RankingWithGame } } pageInfo { __typename endCursor hasNextPage } } shelves { __typename ...ShelfBasic } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.User }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("rankingsCount", Int.self),
      .field("followerCount", Int.self),
      .field("followingCount", Int.self),
      .field("rankings", Rankings.self, arguments: ["first": 10]),
      .field("shelves", [Shelf].self),
      .fragment(UserBasic.self),
    ] }

    var rankingsCount: Int { __data["rankingsCount"] }
    var followerCount: Int { __data["followerCount"] }
    var followingCount: Int { __data["followingCount"] }
    var rankings: Rankings { __data["rankings"] }
    var shelves: [Shelf] { __data["shelves"] }
    var id: Api.ID { __data["id"] }
    var real_name: String { __data["real_name"] }
    var photo_url: String { __data["photo_url"] }

    struct Fragments: FragmentContainer {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      var userBasic: UserBasic { _toFragment() }
    }

    /// Rankings
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

      /// Rankings.Edge
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

        /// Rankings.Edge.Ranking
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

          /// Rankings.Edge.Ranking.Game
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

          /// Rankings.Edge.Ranking.Shelf
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

      /// Rankings.PageInfo
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
  }

}