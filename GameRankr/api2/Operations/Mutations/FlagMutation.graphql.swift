// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class FlagMutation: GraphQLMutation {
    static let operationName: String = "Flag"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Flag($resourceId: ID!, $resourceType: String!, $text: String) { flag(resource_id: $resourceId, resource_type: $resourceType, text: $text) }"#
      ))

    public var resourceId: ID
    public var resourceType: String
    public var text: GraphQLNullable<String>

    public init(
      resourceId: ID,
      resourceType: String,
      text: GraphQLNullable<String>
    ) {
      self.resourceId = resourceId
      self.resourceType = resourceType
      self.text = text
    }

    public var __variables: Variables? { [
      "resourceId": resourceId,
      "resourceType": resourceType,
      "text": text
    ] }

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("flag", Bool.self, arguments: [
          "resource_id": .variable("resourceId"),
          "resource_type": .variable("resourceType"),
          "text": .variable("text")
        ]),
      ] }

      var flag: Bool { __data["flag"] }
    }
  }

}