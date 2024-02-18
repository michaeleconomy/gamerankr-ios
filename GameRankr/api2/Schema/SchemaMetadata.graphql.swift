// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol Api_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Api.SchemaMetadata {}

protocol Api_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Api.SchemaMetadata {}

protocol Api_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Api.SchemaMetadata {}

protocol Api_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Api.SchemaMetadata {}

extension Api {
  typealias ID = String

  typealias SelectionSet = Api_SelectionSet

  typealias InlineFragment = Api_InlineFragment

  typealias MutableSelectionSet = Api_MutableSelectionSet

  typealias MutableInlineFragment = Api_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Mutation": return Api.Objects.Mutation
      case "Ranking": return Api.Objects.Ranking
      case "Shelf": return Api.Objects.Shelf
      case "Port": return Api.Objects.Port
      case "Platform": return Api.Objects.Platform
      case "Game": return Api.Objects.Game
      case "Comment": return Api.Objects.Comment
      case "User": return Api.Objects.User
      case "Query": return Api.Objects.Query
      case "CommentConnection": return Api.Objects.CommentConnection
      case "CommentEdge": return Api.Objects.CommentEdge
      case "PageInfo": return Api.Objects.PageInfo
      case "RankingConnection": return Api.Objects.RankingConnection
      case "RankingEdge": return Api.Objects.RankingEdge
      case "UserConnection": return Api.Objects.UserConnection
      case "UserEdge": return Api.Objects.UserEdge
      case "PlatformConnection": return Api.Objects.PlatformConnection
      case "PlatformEdge": return Api.Objects.PlatformEdge
      case "GameConnection": return Api.Objects.GameConnection
      case "GameEdge": return Api.Objects.GameEdge
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}