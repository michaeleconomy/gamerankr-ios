// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class MyShelvesQuery: GraphQLQuery {
    static let operationName: String = "MyShelves"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyShelves { shelves: my_shelves { __typename id name } }"#
      ))

    public init() {}

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("my_shelves", alias: "shelves", [Shelf].self),
      ] }

      var shelves: [Shelf] { __data["shelves"] }

      /// Shelf
      ///
      /// Parent Type: `Shelf`
      struct Shelf: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.Shelf }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Api.ID.self),
          .field("name", String.self),
        ] }

        var id: Api.ID { __data["id"] }
        var name: String { __data["name"] }
      }
    }
  }

}