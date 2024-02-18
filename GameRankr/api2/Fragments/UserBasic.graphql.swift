// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  struct UserBasic: Api.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment UserBasic on User { __typename id real_name photo_url }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { Api.Objects.User }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Api.ID.self),
      .field("real_name", String.self),
      .field("photo_url", String.self),
    ] }

    var id: Api.ID { __data["id"] }
    var real_name: String { __data["real_name"] }
    var photo_url: String { __data["photo_url"] }
  }

}