// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class PlatformsQuery: GraphQLQuery {
    static let operationName: String = "Platforms"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Platforms($after: String) { platforms(first: 30, after: $after) { __typename edges { __typename platform: node { __typename ...PlatformBasic } } pageInfo { __typename endCursor hasNextPage } } }"#,
        fragments: [PlatformBasic.self]
      ))

    public var after: GraphQLNullable<String>

    public init(after: GraphQLNullable<String>) {
      self.after = after
    }

    public var __variables: Variables? { ["after": after] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("platforms", Platforms.self, arguments: [
          "first": 30,
          "after": .variable("after")
        ]),
      ] }

      var platforms: Platforms { __data["platforms"] }

      /// Platforms
      ///
      /// Parent Type: `PlatformConnection`
      struct Platforms: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.PlatformConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo.self),
        ] }

        /// A list of edges.
        var edges: [Edge?]? { __data["edges"] }
        /// Information to aid in pagination.
        var pageInfo: PageInfo { __data["pageInfo"] }

        /// Platforms.Edge
        ///
        /// Parent Type: `PlatformEdge`
        struct Edge: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.PlatformEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", alias: "platform", Platform?.self),
          ] }

          /// The item at the end of the edge.
          var platform: Platform? { __data["platform"] }

          /// Platforms.Edge.Platform
          ///
          /// Parent Type: `Platform`
          struct Platform: Api.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { Api.Objects.Platform }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(PlatformBasic.self),
            ] }

            var id: Api.ID { __data["id"] }
            var name: String { __data["name"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var platformBasic: PlatformBasic { _toFragment() }
            }
          }
        }

        /// Platforms.PageInfo
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