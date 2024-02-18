// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class DestroyRankingMutation: GraphQLMutation {
    static let operationName: String = "DestroyRanking"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DestroyRanking($portId: ID!) { ranking: destroy_ranking(port_id: $portId) { __typename id game { __typename id } } }"#
      ))

    public var portId: ID

    public init(portId: ID) {
      self.portId = portId
    }

    public var __variables: Variables? { ["portId": portId] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("destroy_ranking", alias: "ranking", Ranking.self, arguments: ["port_id": .variable("portId")]),
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
          .field("id", Api.ID.self),
          .field("game", Game?.self),
        ] }

        var id: Api.ID { __data["id"] }
        var game: Game? { __data["game"] }

        /// Ranking.Game
        ///
        /// Parent Type: `Game`
        struct Game: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.Game }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Api.ID.self),
          ] }

          var id: Api.ID { __data["id"] }
        }
      }
    }
  }

}