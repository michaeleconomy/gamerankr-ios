// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Api {
  class MeQuery: GraphQLQuery {
    static let operationName: String = "Me"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Me { user: me { __typename ...UserDetail } }"#,
        fragments: [GameBasic.self, RankingBasic.self, RankingWithGame.self, ShelfBasic.self, UserBasic.self, UserDetail.self]
      ))

    public init() {}

    struct Data: Api.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Api.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("me", alias: "user", User.self),
      ] }

      var user: User { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      struct User: Api.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Api.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(UserDetail.self),
        ] }

        var rankingsCount: Int { __data["rankingsCount"] }
        var followerCount: Int { __data["followerCount"] }
        var followingCount: Int { __data["followingCount"] }
        var rankings: Rankings { __data["rankings"] }
        var shelves: [Shelf] { __data["shelves"] }
        var id: Api.ID { __data["id"] }
        var real_name: String { __data["real_name"] }
        var photo_url: String { __data["photo_url"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var userDetail: UserDetail { _toFragment() }
          var userBasic: UserBasic { _toFragment() }
        }

        typealias Rankings = UserDetail.Rankings

        /// User.Shelf
        ///
        /// Parent Type: `Shelf`
        struct Shelf: Api.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Api.Objects.Shelf }

          var id: Api.ID { __data["id"] }
          var name: String { __data["name"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var shelfBasic: ShelfBasic { _toFragment() }
          }
        }
      }
    }
  }

}