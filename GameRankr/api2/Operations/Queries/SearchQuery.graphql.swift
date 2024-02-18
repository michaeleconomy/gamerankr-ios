// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class SearchQuery: GraphQLQuery {
    static let operationName: String = "Search"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Search($query: String!, $after: String) { search(query: $query, first: 30, after: $after) { __typename edges { __typename game: node { __typename ...GameBasic } } pageInfo { __typename endCursor hasNextPage } } }"#,
        fragments: [GameBasic.self]
      ))

    public var query: String
    public var after: GraphQLNullable<String>

    public init(
      query: String,
      after: GraphQLNullable<String>
    ) {
      self.query = query
      self.after = after
    }

    public var __variables: Variables? { [
      "query": query,
      "after": after
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("search", Search.self, arguments: [
          "query": .variable("query"),
          "first": 30,
          "after": .variable("after")
        ]),
      ] }

      /// get games matching the query string
      var search: Search { __data["search"] }

      /// Search
      ///
      /// Parent Type: `GameConnection`
      struct Search: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.GameConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo.self),
        ] }

        /// A list of edges.
        var edges: [Edge?]? { __data["edges"] }
        /// Information to aid in pagination.
        var pageInfo: PageInfo { __data["pageInfo"] }

        /// Search.Edge
        ///
        /// Parent Type: `GameEdge`
        struct Edge: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.GameEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", alias: "game", Game?.self),
          ] }

          /// The item at the end of the edge.
          var game: Game? { __data["game"] }

          /// Search.Edge.Game
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

        /// Search.PageInfo
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