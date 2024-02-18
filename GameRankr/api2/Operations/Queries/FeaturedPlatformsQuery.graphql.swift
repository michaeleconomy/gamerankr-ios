// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class FeaturedPlatformsQuery: GraphQLQuery {
    static let operationName: String = "FeaturedPlatforms"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query FeaturedPlatforms { platforms: featured_platforms { __typename ...PlatformBasic } }"#,
        fragments: [PlatformBasic.self]
      ))

    public init() {}

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("featured_platforms", alias: "platforms", [Platform].self),
      ] }

      var platforms: [Platform] { __data["platforms"] }

      /// Platform
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
  }

}