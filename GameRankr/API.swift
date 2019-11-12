//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation Comment($resourceId: ID!, $resourceType: String!, $comment: String!) {
      comment(resource_id: $resourceId, resource_type: $resourceType, comment: $comment) {
        __typename
        ...CommentBasic
      }
    }
    """

  public let operationName = "Comment"

  public var queryDocument: String { return operationDefinition.appending(CommentBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var resourceId: GraphQLID
  public var resourceType: String
  public var comment: String

  public init(resourceId: GraphQLID, resourceType: String, comment: String) {
    self.resourceId = resourceId
    self.resourceType = resourceType
    self.comment = comment
  }

  public var variables: GraphQLMap? {
    return ["resourceId": resourceId, "resourceType": resourceType, "comment": comment]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("comment", arguments: ["resource_id": GraphQLVariable("resourceId"), "resource_type": GraphQLVariable("resourceType"), "comment": GraphQLVariable("comment")], type: .nonNull(.object(Comment.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comment: Comment) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "comment": comment.resultMap])
    }

    public var comment: Comment {
      get {
        return Comment(unsafeResultMap: resultMap["comment"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CommentBasic.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var commentBasic: CommentBasic {
          get {
            return CommentBasic(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DestroyCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation DestroyComment($id: ID!) {
      comment: destroy_comment(id: $id) {
        __typename
        ...CommentBasic
      }
    }
    """

  public let operationName = "DestroyComment"

  public var queryDocument: String { return operationDefinition.appending(CommentBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("destroy_comment", alias: "comment", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Comment.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comment: Comment) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "comment": comment.resultMap])
    }

    public var comment: Comment {
      get {
        return Comment(unsafeResultMap: resultMap["comment"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CommentBasic.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var commentBasic: CommentBasic {
          get {
            return CommentBasic(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DestroyRankingMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation DestroyRanking($portId: ID!) {
      ranking: destroy_ranking(port_id: $portId) {
        __typename
        id
        game {
          __typename
          id
        }
      }
    }
    """

  public let operationName = "DestroyRanking"

  public var portId: GraphQLID

  public init(portId: GraphQLID) {
    self.portId = portId
  }

  public var variables: GraphQLMap? {
    return ["portId": portId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("destroy_ranking", alias: "ranking", arguments: ["port_id": GraphQLVariable("portId")], type: .nonNull(.object(Ranking.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(ranking: Ranking) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ranking": ranking.resultMap])
    }

    public var ranking: Ranking {
      get {
        return Ranking(unsafeResultMap: resultMap["ranking"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "ranking")
      }
    }

    public struct Ranking: GraphQLSelectionSet {
      public static let possibleTypes = ["Ranking"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("game", type: .nonNull(.object(Game.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, game: Game) {
        self.init(unsafeResultMap: ["__typename": "Ranking", "id": id, "game": game.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var game: Game {
        get {
          return Game(unsafeResultMap: resultMap["game"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "game")
        }
      }

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class FlagMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation Flag($resourceId: ID, $resourceType: String, $text: String) {
      flag(resource_id: $resourceId, resource_type: $resourceType, text: $text)
    }
    """

  public let operationName = "Flag"

  public var resourceId: GraphQLID?
  public var resourceType: String?
  public var text: String?

  public init(resourceId: GraphQLID? = nil, resourceType: String? = nil, text: String? = nil) {
    self.resourceId = resourceId
    self.resourceType = resourceType
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["resourceId": resourceId, "resourceType": resourceType, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("flag", arguments: ["resource_id": GraphQLVariable("resourceId"), "resource_type": GraphQLVariable("resourceType"), "text": GraphQLVariable("text")], type: .nonNull(.scalar(Bool.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(flag: Bool) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "flag": flag])
    }

    public var flag: Bool {
      get {
        return resultMap["flag"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "flag")
      }
    }
  }
}

public final class RankPortMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation RankPort($portId: ID!, $ranking: Int, $removeRanking: Boolean, $review: String, $addShelfId: ID, $removeShelfId: ID) {
      ranking: rank_port(port_id: $portId, ranking: $ranking, remove_ranking: $removeRanking, review: $review, add_shelf_id: $addShelfId, remove_shelf_id: $removeShelfId) {
        __typename
        ...RankingWithGame
      }
    }
    """

  public let operationName = "RankPort"

  public var queryDocument: String { return operationDefinition.appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public var portId: GraphQLID
  public var ranking: Int?
  public var removeRanking: Bool?
  public var review: String?
  public var addShelfId: GraphQLID?
  public var removeShelfId: GraphQLID?

  public init(portId: GraphQLID, ranking: Int? = nil, removeRanking: Bool? = nil, review: String? = nil, addShelfId: GraphQLID? = nil, removeShelfId: GraphQLID? = nil) {
    self.portId = portId
    self.ranking = ranking
    self.removeRanking = removeRanking
    self.review = review
    self.addShelfId = addShelfId
    self.removeShelfId = removeShelfId
  }

  public var variables: GraphQLMap? {
    return ["portId": portId, "ranking": ranking, "removeRanking": removeRanking, "review": review, "addShelfId": addShelfId, "removeShelfId": removeShelfId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("rank_port", alias: "ranking", arguments: ["port_id": GraphQLVariable("portId"), "ranking": GraphQLVariable("ranking"), "remove_ranking": GraphQLVariable("removeRanking"), "review": GraphQLVariable("review"), "add_shelf_id": GraphQLVariable("addShelfId"), "remove_shelf_id": GraphQLVariable("removeShelfId")], type: .nonNull(.object(Ranking.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(ranking: Ranking) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ranking": ranking.resultMap])
    }

    public var ranking: Ranking {
      get {
        return Ranking(unsafeResultMap: resultMap["ranking"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "ranking")
      }
    }

    public struct Ranking: GraphQLSelectionSet {
      public static let possibleTypes = ["Ranking"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(RankingWithGame.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var rankingWithGame: RankingWithGame {
          get {
            return RankingWithGame(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CommentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Comments($resourceId: ID!, $resourceType: String!, $after: String) {
      comments(resource_id: $resourceId, resource_type: $resourceType, first: 30, after: $after) {
        __typename
        edges {
          __typename
          comment: node {
            __typename
            ...CommentBasic
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "Comments"

  public var queryDocument: String { return operationDefinition.appending(CommentBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var resourceId: GraphQLID
  public var resourceType: String
  public var after: String?

  public init(resourceId: GraphQLID, resourceType: String, after: String? = nil) {
    self.resourceId = resourceId
    self.resourceType = resourceType
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["resourceId": resourceId, "resourceType": resourceType, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("comments", arguments: ["resource_id": GraphQLVariable("resourceId"), "resource_type": GraphQLVariable("resourceType"), "first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Comment.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comments: Comment) {
      self.init(unsafeResultMap: ["__typename": "Query", "comments": comments.resultMap])
    }

    public var comments: Comment {
      get {
        return Comment(unsafeResultMap: resultMap["comments"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "comments")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["CommentConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "CommentConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["CommentEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "comment", type: .object(Comment.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(comment: Comment? = nil) {
          self.init(unsafeResultMap: ["__typename": "CommentEdge", "comment": comment.flatMap { (value: Comment) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var comment: Comment? {
          get {
            return (resultMap["comment"] as? ResultMap).flatMap { Comment(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "comment")
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["Comment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CommentBasic.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var commentBasic: CommentBasic {
              get {
                return CommentBasic(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class FeaturedPlatformsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query FeaturedPlatforms {
      platforms: featured_platforms {
        __typename
        ...PlatformBasic
      }
    }
    """

  public let operationName = "FeaturedPlatforms"

  public var queryDocument: String { return operationDefinition.appending(PlatformBasic.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("featured_platforms", alias: "platforms", type: .nonNull(.list(.nonNull(.object(Platform.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(platforms: [Platform]) {
      self.init(unsafeResultMap: ["__typename": "Query", "platforms": platforms.map { (value: Platform) -> ResultMap in value.resultMap }])
    }

    public var platforms: [Platform] {
      get {
        return (resultMap["platforms"] as! [ResultMap]).map { (value: ResultMap) -> Platform in Platform(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Platform) -> ResultMap in value.resultMap }, forKey: "platforms")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platform"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(PlatformBasic.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Platform", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var platformBasic: PlatformBasic {
          get {
            return PlatformBasic(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class FriendsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Friends($after: String) {
      friends(first: 30, after: $after) {
        __typename
        edges {
          __typename
          user: node {
            __typename
            ...UserBasic
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "Friends"

  public var queryDocument: String { return operationDefinition.appending(UserBasic.fragmentDefinition) }

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("friends", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Friend.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(friends: Friend) {
      self.init(unsafeResultMap: ["__typename": "Query", "friends": friends.resultMap])
    }

    public var friends: Friend {
      get {
        return Friend(unsafeResultMap: resultMap["friends"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "friends")
      }
    }

    public struct Friend: GraphQLSelectionSet {
      public static let possibleTypes = ["UserConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "UserConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["UserEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "user", type: .object(User.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserEdge", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserBasic.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, realName: String, photoUrl: String) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var userBasic: UserBasic {
              get {
                return UserBasic(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class GameQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Game($id: ID!) {
      game(id: $id) {
        __typename
        ...GameBasic
        ports {
          __typename
          id
          medium_image_url
          description
        }
        rankings(first: 30) {
          __typename
          edges {
            __typename
            node {
              __typename
              ...RankingWithUser
            }
          }
          pageInfo {
            __typename
            endCursor
            hasNextPage
          }
        }
        friend_rankings {
          __typename
          ...RankingWithUser
        }
      }
    }
    """

  public let operationName = "Game"

  public var queryDocument: String { return operationDefinition.appending(GameBasic.fragmentDefinition).appending(RankingWithUser.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("game", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Game.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(game: Game) {
      self.init(unsafeResultMap: ["__typename": "Query", "game": game.resultMap])
    }

    public var game: Game {
      get {
        return Game(unsafeResultMap: resultMap["game"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "game")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GameBasic.self),
        GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
        GraphQLField("rankings", arguments: ["first": 30], type: .nonNull(.object(Ranking.selections))),
        GraphQLField("friend_rankings", type: .nonNull(.list(.nonNull(.object(FriendRanking.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ports: [Port] {
        get {
          return (resultMap["ports"] as! [ResultMap]).map { (value: ResultMap) -> Port in Port(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Port) -> ResultMap in value.resultMap }, forKey: "ports")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(unsafeResultMap: resultMap["rankings"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rankings")
        }
      }

      public var friendRankings: [FriendRanking] {
        get {
          return (resultMap["friend_rankings"] as! [ResultMap]).map { (value: ResultMap) -> FriendRanking in FriendRanking(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: FriendRanking) -> ResultMap in value.resultMap }, forKey: "friend_rankings")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var gameBasic: GameBasic {
          get {
            return GameBasic(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Port: GraphQLSelectionSet {
        public static let possibleTypes = ["Port"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("medium_image_url", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, mediumImageUrl: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Port", "id": id, "medium_image_url": mediumImageUrl, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var mediumImageUrl: String? {
          get {
            return resultMap["medium_image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "medium_image_url")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "RankingEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RankingWithUser.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var rankingWithUser: RankingWithUser {
                get {
                  return RankingWithUser(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }

      public struct FriendRanking: GraphQLSelectionSet {
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(RankingWithUser.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var rankingWithUser: RankingWithUser {
            get {
              return RankingWithUser(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GameRankingsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GameRankings($id: ID!, $after: String) {
      game(id: $id) {
        __typename
        rankings(first: 30, after: $after) {
          __typename
          edges {
            __typename
            ranking: node {
              __typename
              ...RankingWithUser
            }
          }
          pageInfo {
            __typename
            endCursor
            hasNextPage
          }
        }
      }
    }
    """

  public let operationName = "GameRankings"

  public var queryDocument: String { return operationDefinition.appending(RankingWithUser.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var id: GraphQLID
  public var after: String?

  public init(id: GraphQLID, after: String? = nil) {
    self.id = id
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["id": id, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("game", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Game.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(game: Game) {
      self.init(unsafeResultMap: ["__typename": "Query", "game": game.resultMap])
    }

    public var game: Game {
      get {
        return Game(unsafeResultMap: resultMap["game"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "game")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rankings: Ranking) {
        self.init(unsafeResultMap: ["__typename": "Game", "rankings": rankings.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(unsafeResultMap: resultMap["rankings"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(ranking: Ranking? = nil) {
            self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RankingWithUser.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var rankingWithUser: RankingWithUser {
                get {
                  return RankingWithUser(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Me {
      user: me {
        __typename
        ...UserDetail
      }
    }
    """

  public let operationName = "Me"

  public var queryDocument: String { return operationDefinition.appending(UserDetail.fragmentDefinition).appending(UserBasic.fragmentDefinition).appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", alias: "user", type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserDetail.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var userDetail: UserDetail {
          get {
            return UserDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class MyGamesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query MyGames($after: String) {
      my_games(first: 30, after: $after) {
        __typename
        edges {
          __typename
          ranking: node {
            __typename
            ...RankingWithGame
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "MyGames"

  public var queryDocument: String { return operationDefinition.appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("my_games", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(MyGame.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(myGames: MyGame) {
      self.init(unsafeResultMap: ["__typename": "Query", "my_games": myGames.resultMap])
    }

    /// get games the current user has added
    public var myGames: MyGame {
      get {
        return MyGame(unsafeResultMap: resultMap["my_games"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "my_games")
      }
    }

    public struct MyGame: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ranking: Ranking? = nil) {
          self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var ranking: Ranking? {
          get {
            return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
          }
        }

        public struct Ranking: GraphQLSelectionSet {
          public static let possibleTypes = ["Ranking"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RankingWithGame.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var rankingWithGame: RankingWithGame {
              get {
                return RankingWithGame(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class MyShelvesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query MyShelves {
      shelves: my_shelves {
        __typename
        id
        name
      }
    }
    """

  public let operationName = "MyShelves"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("my_shelves", alias: "shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(shelves: [Shelf]) {
      self.init(unsafeResultMap: ["__typename": "Query", "shelves": shelves.map { (value: Shelf) -> ResultMap in value.resultMap }])
    }

    public var shelves: [Shelf] {
      get {
        return (resultMap["shelves"] as! [ResultMap]).map { (value: ResultMap) -> Shelf in Shelf(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Shelf) -> ResultMap in value.resultMap }, forKey: "shelves")
      }
    }

    public struct Shelf: GraphQLSelectionSet {
      public static let possibleTypes = ["Shelf"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Shelf", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class PlatformsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Platforms($after: String) {
      platforms(first: 30, after: $after) {
        __typename
        edges {
          __typename
          platform: node {
            __typename
            ...PlatformBasic
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "Platforms"

  public var queryDocument: String { return operationDefinition.appending(PlatformBasic.fragmentDefinition) }

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("platforms", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Platform.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(platforms: Platform) {
      self.init(unsafeResultMap: ["__typename": "Query", "platforms": platforms.resultMap])
    }

    public var platforms: Platform {
      get {
        return Platform(unsafeResultMap: resultMap["platforms"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "platforms")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["PlatformConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "PlatformConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["PlatformEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "platform", type: .object(Platform.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(platform: Platform? = nil) {
          self.init(unsafeResultMap: ["__typename": "PlatformEdge", "platform": platform.flatMap { (value: Platform) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var platform: Platform? {
          get {
            return (resultMap["platform"] as? ResultMap).flatMap { Platform(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "platform")
          }
        }

        public struct Platform: GraphQLSelectionSet {
          public static let possibleTypes = ["Platform"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PlatformBasic.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String) {
            self.init(unsafeResultMap: ["__typename": "Platform", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var platformBasic: PlatformBasic {
              get {
                return PlatformBasic(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class PopularGamesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query PopularGames {
      games: popular_games {
        __typename
        ...GameBasic
      }
    }
    """

  public let operationName = "PopularGames"

  public var queryDocument: String { return operationDefinition.appending(GameBasic.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("popular_games", alias: "games", type: .nonNull(.list(.nonNull(.object(Game.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(games: [Game]) {
      self.init(unsafeResultMap: ["__typename": "Query", "games": games.map { (value: Game) -> ResultMap in value.resultMap }])
    }

    public var games: [Game] {
      get {
        return (resultMap["games"] as! [ResultMap]).map { (value: ResultMap) -> Game in Game(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Game) -> ResultMap in value.resultMap }, forKey: "games")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GameBasic.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var gameBasic: GameBasic {
          get {
            return GameBasic(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class RecentReviewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query RecentReviews($after: String) {
      recent_reviews(first: 30, after: $after) {
        __typename
        edges {
          __typename
          ranking: node {
            __typename
            ...RankingFull
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "RecentReviews"

  public var queryDocument: String { return operationDefinition.appending(RankingFull.fragmentDefinition).appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("recent_reviews", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(RecentReview.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recentReviews: RecentReview) {
      self.init(unsafeResultMap: ["__typename": "Query", "recent_reviews": recentReviews.resultMap])
    }

    public var recentReviews: RecentReview {
      get {
        return RecentReview(unsafeResultMap: resultMap["recent_reviews"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "recent_reviews")
      }
    }

    public struct RecentReview: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ranking: Ranking? = nil) {
          self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var ranking: Ranking? {
          get {
            return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
          }
        }

        public struct Ranking: GraphQLSelectionSet {
          public static let possibleTypes = ["Ranking"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RankingFull.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var rankingFull: RankingFull {
              get {
                return RankingFull(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Search($query: String!, $after: String) {
      search(query: $query, first: 30, after: $after) {
        __typename
        edges {
          __typename
          game: node {
            __typename
            ...GameBasic
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "Search"

  public var queryDocument: String { return operationDefinition.appending(GameBasic.fragmentDefinition) }

  public var query: String
  public var after: String?

  public init(query: String, after: String? = nil) {
    self.query = query
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["query": query, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("query"), "first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// get games matching the query string
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["GameConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "GameConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["GameEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "game", type: .object(Game.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(game: Game? = nil) {
          self.init(unsafeResultMap: ["__typename": "GameEdge", "game": game.flatMap { (value: Game) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var game: Game? {
          get {
            return (resultMap["game"] as? ResultMap).flatMap { Game(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "game")
          }
        }

        public struct Game: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GameBasic.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var gameBasic: GameBasic {
              get {
                return GameBasic(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class ShelfQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Shelf($id: ID!, $after: String) {
      shelf(id: $id) {
        __typename
        rankings(first: 30, after: $after) {
          __typename
          edges {
            __typename
            ranking: node {
              __typename
              ...RankingWithGame
            }
          }
          pageInfo {
            __typename
            endCursor
            hasNextPage
          }
        }
      }
    }
    """

  public let operationName = "Shelf"

  public var queryDocument: String { return operationDefinition.appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public var id: GraphQLID
  public var after: String?

  public init(id: GraphQLID, after: String? = nil) {
    self.id = id
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["id": id, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("shelf", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Shelf.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(shelf: Shelf) {
      self.init(unsafeResultMap: ["__typename": "Query", "shelf": shelf.resultMap])
    }

    public var shelf: Shelf {
      get {
        return Shelf(unsafeResultMap: resultMap["shelf"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "shelf")
      }
    }

    public struct Shelf: GraphQLSelectionSet {
      public static let possibleTypes = ["Shelf"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rankings: Ranking) {
        self.init(unsafeResultMap: ["__typename": "Shelf", "rankings": rankings.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(unsafeResultMap: resultMap["rankings"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(ranking: Ranking? = nil) {
            self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RankingWithGame.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public final class UpdatesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Updates($after: String) {
      updates(first: 30, after: $after) {
        __typename
        edges {
          __typename
          ranking: node {
            __typename
            ...RankingFull
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
    }
    """

  public let operationName = "Updates"

  public var queryDocument: String { return operationDefinition.appending(RankingFull.fragmentDefinition).appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition).appending(UserBasic.fragmentDefinition) }

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updates", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Update.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updates: Update) {
      self.init(unsafeResultMap: ["__typename": "Query", "updates": updates.resultMap])
    }

    public var updates: Update {
      get {
        return Update(unsafeResultMap: resultMap["updates"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updates")
      }
    }

    public struct Update: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ranking: Ranking? = nil) {
          self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var ranking: Ranking? {
          get {
            return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
          }
        }

        public struct Ranking: GraphQLSelectionSet {
          public static let possibleTypes = ["Ranking"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RankingFull.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var rankingFull: RankingFull {
              get {
                return RankingFull(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class UserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query User($id: ID!) {
      user(id: $id) {
        __typename
        ...UserDetail
      }
    }
    """

  public let operationName = "User"

  public var queryDocument: String { return operationDefinition.appending(UserDetail.fragmentDefinition).appending(UserBasic.fragmentDefinition).appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserDetail.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var userDetail: UserDetail {
          get {
            return UserDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UserRankingsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query UserRankings($id: ID!, $after: String) {
      user(id: $id) {
        __typename
        rankings(first: 30, after: $after) {
          __typename
          edges {
            __typename
            ranking: node {
              __typename
              ...RankingWithGame
            }
          }
          pageInfo {
            __typename
            endCursor
            hasNextPage
          }
        }
      }
    }
    """

  public let operationName = "UserRankings"

  public var queryDocument: String { return operationDefinition.appending(RankingWithGame.fragmentDefinition).appending(RankingBasic.fragmentDefinition).appending(ShelfBasic.fragmentDefinition).appending(GameBasic.fragmentDefinition) }

  public var id: GraphQLID
  public var after: String?

  public init(id: GraphQLID, after: String? = nil) {
    self.id = id
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["id": id, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rankings: Ranking) {
        self.init(unsafeResultMap: ["__typename": "User", "rankings": rankings.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(unsafeResultMap: resultMap["rankings"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(ranking: Ranking? = nil) {
            self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RankingWithGame.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public struct CommentBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment CommentBasic on Comment {
      __typename
      id
      comment
      created_at
      user {
        __typename
        ...UserBasic
      }
    }
    """

  public static let possibleTypes = ["Comment"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("comment", type: .nonNull(.scalar(String.self))),
    GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, comment: String, createdAt: String, user: User) {
    self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "comment": comment, "created_at": createdAt, "user": user.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var comment: String {
    get {
      return resultMap["comment"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "comment")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["created_at"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "created_at")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(UserBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userBasic: UserBasic {
        get {
          return UserBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct GameBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment GameBasic on Game {
      __typename
      id
      title
      url
      ports {
        __typename
        id
        platform {
          __typename
          id
          name
        }
        small_image_url
      }
    }
    """

  public static let possibleTypes = ["Game"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
    GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String, url: String, ports: [Port]) {
    self.init(unsafeResultMap: ["__typename": "Game", "id": id, "title": title, "url": url, "ports": ports.map { (value: Port) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public var ports: [Port] {
    get {
      return (resultMap["ports"] as! [ResultMap]).map { (value: ResultMap) -> Port in Port(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Port) -> ResultMap in value.resultMap }, forKey: "ports")
    }
  }

  public struct Port: GraphQLSelectionSet {
    public static let possibleTypes = ["Port"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("platform", type: .nonNull(.object(Platform.selections))),
      GraphQLField("small_image_url", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Port", "id": id, "platform": platform.resultMap, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(unsafeResultMap: resultMap["platform"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return resultMap["small_image_url"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platform"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Platform", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct PlatformBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment PlatformBasic on Platform {
      __typename
      id
      name
    }
    """

  public static let possibleTypes = ["Platform"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String) {
    self.init(unsafeResultMap: ["__typename": "Platform", "id": id, "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct RankingBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment RankingBasic on Ranking {
      __typename
      id
      ranking
      review
      verb
      comments_count
      url
      shelves {
        __typename
        ...ShelfBasic
      }
      port {
        __typename
        id
        platform {
          __typename
          id
          name
        }
        small_image_url
      }
    }
    """

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, url: String, shelves: [Shelf], port: Port) {
    self.init(unsafeResultMap: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "url": url, "shelves": shelves.map { (value: Shelf) -> ResultMap in value.resultMap }, "port": port.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var ranking: Int? {
    get {
      return resultMap["ranking"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "ranking")
    }
  }

  public var review: String? {
    get {
      return resultMap["review"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "review")
    }
  }

  public var verb: String {
    get {
      return resultMap["verb"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "verb")
    }
  }

  public var commentsCount: Int {
    get {
      return resultMap["comments_count"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (resultMap["shelves"] as! [ResultMap]).map { (value: ResultMap) -> Shelf in Shelf(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Shelf) -> ResultMap in value.resultMap }, forKey: "shelves")
    }
  }

  public var port: Port {
    get {
      return Port(unsafeResultMap: resultMap["port"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "port")
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(ShelfBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String) {
      self.init(unsafeResultMap: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Port: GraphQLSelectionSet {
    public static let possibleTypes = ["Port"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("platform", type: .nonNull(.object(Platform.selections))),
      GraphQLField("small_image_url", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Port", "id": id, "platform": platform.resultMap, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(unsafeResultMap: resultMap["platform"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return resultMap["small_image_url"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platform"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Platform", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct RankingFull: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment RankingFull on Ranking {
      __typename
      ...RankingWithGame
      user {
        __typename
        ...UserBasic
      }
    }
    """

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(RankingWithGame.self),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(unsafeResultMap: resultMap)
    }
    set {
      resultMap += newValue.resultMap
    }
  }

  public struct Fragments {
    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var rankingWithGame: RankingWithGame {
      get {
        return RankingWithGame(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(UserBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userBasic: UserBasic {
        get {
          return UserBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct RankingWithGame: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment RankingWithGame on Ranking {
      __typename
      ...RankingBasic
      game {
        __typename
        ...GameBasic
      }
    }
    """

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(RankingBasic.self),
    GraphQLField("game", type: .nonNull(.object(Game.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var game: Game {
    get {
      return Game(unsafeResultMap: resultMap["game"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "game")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(unsafeResultMap: resultMap)
    }
    set {
      resultMap += newValue.resultMap
    }
  }

  public struct Fragments {
    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var rankingBasic: RankingBasic {
      get {
        return RankingBasic(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }

  public struct Game: GraphQLSelectionSet {
    public static let possibleTypes = ["Game"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GameBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var gameBasic: GameBasic {
        get {
          return GameBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct RankingWithUser: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment RankingWithUser on Ranking {
      __typename
      ...RankingBasic
      user {
        __typename
        ...UserBasic
      }
    }
    """

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(RankingBasic.self),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(unsafeResultMap: resultMap)
    }
    set {
      resultMap += newValue.resultMap
    }
  }

  public struct Fragments {
    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var rankingBasic: RankingBasic {
      get {
        return RankingBasic(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(UserBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userBasic: UserBasic {
        get {
          return UserBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct ShelfBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment ShelfBasic on Shelf {
      __typename
      id
      name
    }
    """

  public static let possibleTypes = ["Shelf"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String) {
    self.init(unsafeResultMap: ["__typename": "Shelf", "id": id, "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct UserBasic: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment UserBasic on User {
      __typename
      id
      real_name
      photo_url
    }
    """

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
    GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, realName: String, photoUrl: String) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var realName: String {
    get {
      return resultMap["real_name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "real_name")
    }
  }

  public var photoUrl: String {
    get {
      return resultMap["photo_url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "photo_url")
    }
  }
}

public struct UserDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment UserDetail on User {
      __typename
      ...UserBasic
      rankings(first: 20) {
        __typename
        edges {
          __typename
          ranking: node {
            __typename
            ...RankingWithGame
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
        }
      }
      shelves {
        __typename
        ...ShelfBasic
      }
    }
    """

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLFragmentSpread(UserBasic.self),
    GraphQLField("rankings", arguments: ["first": 20], type: .nonNull(.object(Ranking.selections))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var rankings: Ranking {
    get {
      return Ranking(unsafeResultMap: resultMap["rankings"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "rankings")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (resultMap["shelves"] as! [ResultMap]).map { (value: ResultMap) -> Shelf in Shelf(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Shelf) -> ResultMap in value.resultMap }, forKey: "shelves")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(unsafeResultMap: resultMap)
    }
    set {
      resultMap += newValue.resultMap
    }
  }

  public struct Fragments {
    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var userBasic: UserBasic {
      get {
        return UserBasic(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }

  public struct Ranking: GraphQLSelectionSet {
    public static let possibleTypes = ["RankingConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .list(.object(Edge.selections))),
      GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
      self.init(unsafeResultMap: ["__typename": "RankingConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of edges.
    public var edges: [Edge?]? {
      get {
        return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
      }
    }

    /// Information to aid in pagination.
    public var pageInfo: PageInfo {
      get {
        return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ranking: Ranking? = nil) {
        self.init(unsafeResultMap: ["__typename": "RankingEdge", "ranking": ranking.flatMap { (value: Ranking) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge.
      public var ranking: Ranking? {
        get {
          return (resultMap["ranking"] as? ResultMap).flatMap { Ranking(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ranking")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(RankingWithGame.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var rankingWithGame: RankingWithGame {
            get {
              return RankingWithGame(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct PageInfo: GraphQLSelectionSet {
      public static let possibleTypes = ["PageInfo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("endCursor", type: .scalar(String.self)),
        GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(endCursor: String? = nil, hasNextPage: Bool) {
        self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// When paginating forwards, the cursor to continue.
      public var endCursor: String? {
        get {
          return resultMap["endCursor"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "endCursor")
        }
      }

      /// When paginating forwards, are there more items?
      public var hasNextPage: Bool {
        get {
          return resultMap["hasNextPage"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasNextPage")
        }
      }
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(ShelfBasic.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String) {
      self.init(unsafeResultMap: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
