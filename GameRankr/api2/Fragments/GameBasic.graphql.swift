// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct GameBasic: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment GameBasic on Game { __typename id title url initiallyReleasedAt averageRanking rankingsCount ports { __typename id platform { __typename id name shortName } releasedAt averageRanking rankingsCount small_image_url medium_image_url } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Game }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Api.ID.self),
      .field("title", String.self),
      .field("url", String.self),
      .field("initiallyReleasedAt", String?.self),
      .field("averageRanking", Double.self),
      .field("rankingsCount", Int.self),
      .field("ports", [Port].self),
    ] }

    var id: Api.ID { __data["id"] }
    var title: String { __data["title"] }
    var url: String { __data["url"] }
    var initiallyReleasedAt: String? { __data["initiallyReleasedAt"] }
    var averageRanking: Double { __data["averageRanking"] }
    var rankingsCount: Int { __data["rankingsCount"] }
    var ports: [Port] { __data["ports"] }

    /// Port
    ///
    /// Parent Type: `Port`
    struct Port: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Port }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Api.ID.self),
        .field("platform", Platform.self),
        .field("releasedAt", String?.self),
        .field("averageRanking", Double.self),
        .field("rankingsCount", Int.self),
        .field("small_image_url", String?.self),
        .field("medium_image_url", String?.self),
      ] }

      var id: Api.ID { __data["id"] }
      var platform: Platform { __data["platform"] }
      var releasedAt: String? { __data["releasedAt"] }
      var averageRanking: Double { __data["averageRanking"] }
      var rankingsCount: Int { __data["rankingsCount"] }
      var small_image_url: String? { __data["small_image_url"] }
      var medium_image_url: String? { __data["medium_image_url"] }

      /// Port.Platform
      ///
      /// Parent Type: `Platform`
      struct Platform: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.Platform }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Api.ID.self),
          .field("name", String.self),
          .field("shortName", String.self),
        ] }

        var id: Api.ID { __data["id"] }
        var name: String { __data["name"] }
        var shortName: String { __data["shortName"] }
      }
    }
  }

}