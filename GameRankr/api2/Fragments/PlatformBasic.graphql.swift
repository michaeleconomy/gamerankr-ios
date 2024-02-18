// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct PlatformBasic: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment PlatformBasic on Platform { __typename id name }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.Platform }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Api.ID.self),
      .field("name", String.self),
    ] }

    var id: Api.ID { __data["id"] }
    var name: String { __data["name"] }
  }

}