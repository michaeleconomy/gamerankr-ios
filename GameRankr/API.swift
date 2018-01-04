//  This file was automatically generated and should not be edited.

import Apollo

public final class CommentMutation: GraphQLMutation {
  public static let operationString =
    "mutation Comment($resourceId: ID!, $resourceType: String!, $comment: String!) {\n  comment(resource_id: $resourceId, resource_type: $resourceType, comment: $comment) {\n    __typename\n    ...CommentBasic\n  }\n}"

  public static var requestString: String { return operationString.appending(CommentBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(comment: Comment) {
      self.init(snapshot: ["__typename": "Mutation", "comment": comment.snapshot])
    }

    public var comment: Comment {
      get {
        return Comment(snapshot: snapshot["comment"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, comment: String, createdAt: String, user: User) {
        self.init(snapshot: ["__typename": "Comment", "id": id, "comment": comment, "created_at": createdAt, "user": user.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["created_at"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_at")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["user"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "user")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var commentBasic: CommentBasic {
          get {
            return CommentBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, realName: String, photoUrl: String) {
          self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var realName: String {
          get {
            return snapshot["real_name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "real_name")
          }
        }

        public var photoUrl: String {
          get {
            return snapshot["photo_url"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "photo_url")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userBasic: UserBasic {
            get {
              return UserBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class DestroyCommentMutation: GraphQLMutation {
  public static let operationString =
    "mutation DestroyComment($id: ID!) {\n  comment: destroy_comment(id: $id) {\n    __typename\n    ...CommentBasic\n  }\n}"

  public static var requestString: String { return operationString.appending(CommentBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(comment: Comment) {
      self.init(snapshot: ["__typename": "Mutation", "comment": comment.snapshot])
    }

    public var comment: Comment {
      get {
        return Comment(snapshot: snapshot["comment"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, comment: String, createdAt: String, user: User) {
        self.init(snapshot: ["__typename": "Comment", "id": id, "comment": comment, "created_at": createdAt, "user": user.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["created_at"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_at")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["user"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "user")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var commentBasic: CommentBasic {
          get {
            return CommentBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, realName: String, photoUrl: String) {
          self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var realName: String {
          get {
            return snapshot["real_name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "real_name")
          }
        }

        public var photoUrl: String {
          get {
            return snapshot["photo_url"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "photo_url")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userBasic: UserBasic {
            get {
              return UserBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class DestroyRankingMutation: GraphQLMutation {
  public static let operationString =
    "mutation DestroyRanking($portId: ID!) {\n  ranking: destroy_ranking(port_id: $portId) {\n    __typename\n    id\n    game {\n      __typename\n      id\n    }\n  }\n}"

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(ranking: Ranking) {
      self.init(snapshot: ["__typename": "Mutation", "ranking": ranking.snapshot])
    }

    public var ranking: Ranking {
      get {
        return Ranking(snapshot: snapshot["ranking"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "ranking")
      }
    }

    public struct Ranking: GraphQLSelectionSet {
      public static let possibleTypes = ["Ranking"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("game", type: .nonNull(.object(Game.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, game: Game) {
        self.init(snapshot: ["__typename": "Ranking", "id": id, "game": game.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var game: Game {
        get {
          return Game(snapshot: snapshot["game"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "game")
        }
      }

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "Game", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class RankPortMutation: GraphQLMutation {
  public static let operationString =
    "mutation RankPort($portId: ID!, $ranking: Int, $removeRanking: Boolean, $review: String, $addShelfId: ID, $removeShelfId: ID) {\n  ranking: rank_port(port_id: $portId, ranking: $ranking, remove_ranking: $removeRanking, review: $review, add_shelf_id: $addShelfId, remove_shelf_id: $removeShelfId) {\n    __typename\n    ...RankingWithGame\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(ranking: Ranking) {
      self.init(snapshot: ["__typename": "Mutation", "ranking": ranking.snapshot])
    }

    public var ranking: Ranking {
      get {
        return Ranking(snapshot: snapshot["ranking"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "ranking")
      }
    }

    public struct Ranking: GraphQLSelectionSet {
      public static let possibleTypes = ["Ranking"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ranking", type: .scalar(Int.self)),
        GraphQLField("review", type: .scalar(String.self)),
        GraphQLField("verb", type: .nonNull(.scalar(String.self))),
        GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
        GraphQLField("port", type: .nonNull(.object(Port.selections))),
        GraphQLField("game", type: .nonNull(.object(Game.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
        self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var ranking: Int? {
        get {
          return snapshot["ranking"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ranking")
        }
      }

      public var review: String? {
        get {
          return snapshot["review"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "review")
        }
      }

      public var verb: String {
        get {
          return snapshot["verb"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "verb")
        }
      }

      public var commentsCount: Int {
        get {
          return snapshot["comments_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var shelves: [Shelf] {
        get {
          return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
        }
      }

      public var port: Port {
        get {
          return Port(snapshot: snapshot["port"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "port")
        }
      }

      public var game: Game {
        get {
          return Game(snapshot: snapshot["game"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "game")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var rankingWithGame: RankingWithGame {
          get {
            return RankingWithGame(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public var rankingBasic: RankingBasic {
          get {
            return RankingBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Shelf: GraphQLSelectionSet {
        public static let possibleTypes = ["Shelf"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String) {
          self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var shelfBasic: ShelfBasic {
            get {
              return ShelfBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
          self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var platform: Platform {
          get {
            return Platform(snapshot: snapshot["platform"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "platform")
          }
        }

        public var smallImageUrl: String? {
          get {
            return snapshot["small_image_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "small_image_url")
          }
        }

        public struct Platform: GraphQLSelectionSet {
          public static let possibleTypes = ["Platforms"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, title: String, ports: [Port]) {
          self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var ports: [Port] {
          get {
            return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var gameBasic: GameBasic {
            get {
              return GameBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
            self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var platform: Platform {
            get {
              return Platform(snapshot: snapshot["platform"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "platform")
            }
          }

          public var smallImageUrl: String? {
            get {
              return snapshot["small_image_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "small_image_url")
            }
          }

          public struct Platform: GraphQLSelectionSet {
            public static let possibleTypes = ["Platforms"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, name: String) {
              self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}

public final class CommentsQuery: GraphQLQuery {
  public static let operationString =
    "query Comments($resourceId: ID!, $resourceType: String!, $after: String) {\n  comments(resource_id: $resourceId, resource_type: $resourceType, first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      comment: node {\n        __typename\n        ...CommentBasic\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(CommentBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(comments: Comment) {
      self.init(snapshot: ["__typename": "Query", "comments": comments.snapshot])
    }

    public var comments: Comment {
      get {
        return Comment(snapshot: snapshot["comments"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "comments")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes = ["CommentConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(snapshot: ["__typename": "CommentConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["CommentEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "comment", type: .object(Comment.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(comment: Comment? = nil) {
          self.init(snapshot: ["__typename": "CommentEdge", "comment": comment.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var comment: Comment? {
          get {
            return (snapshot["comment"] as? Snapshot).flatMap { Comment(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "comment")
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["Comment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("comment", type: .nonNull(.scalar(String.self))),
            GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, comment: String, createdAt: String, user: User) {
            self.init(snapshot: ["__typename": "Comment", "id": id, "comment": comment, "created_at": createdAt, "user": user.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var comment: String {
            get {
              return snapshot["comment"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "comment")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["created_at"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "created_at")
            }
          }

          public var user: User {
            get {
              return User(snapshot: snapshot["user"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "user")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var commentBasic: CommentBasic {
              get {
                return CommentBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
              GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, realName: String, photoUrl: String) {
              self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var realName: String {
              get {
                return snapshot["real_name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "real_name")
              }
            }

            public var photoUrl: String {
              get {
                return snapshot["photo_url"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "photo_url")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var userBasic: UserBasic {
                get {
                  return UserBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return snapshot["endCursor"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class FriendsQuery: GraphQLQuery {
  public static let operationString =
    "query Friends($after: String) {\n  friends(first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      user: node {\n        __typename\n        ...UserBasic\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(friends: Friend) {
      self.init(snapshot: ["__typename": "Query", "friends": friends.snapshot])
    }

    public var friends: Friend {
      get {
        return Friend(snapshot: snapshot["friends"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "friends")
      }
    }

    public struct Friend: GraphQLSelectionSet {
      public static let possibleTypes = ["UserConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(snapshot: ["__typename": "UserConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["UserEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "user", type: .object(User.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(user: User? = nil) {
          self.init(snapshot: ["__typename": "UserEdge", "user": user.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var user: User? {
          get {
            return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "user")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, realName: String, photoUrl: String) {
            self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var realName: String {
            get {
              return snapshot["real_name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "real_name")
            }
          }

          public var photoUrl: String {
            get {
              return snapshot["photo_url"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "photo_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userBasic: UserBasic {
              get {
                return UserBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return snapshot["endCursor"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class GameQuery: GraphQLQuery {
  public static let operationString =
    "query Game($id: ID!) {\n  game(id: $id) {\n    __typename\n    ...GameBasic\n    ports {\n      __typename\n      medium_image_url\n    }\n    rankings(first: 30) {\n      __typename\n      edges {\n        __typename\n        node {\n          __typename\n          ...RankingWithUser\n        }\n      }\n      pageInfo {\n        __typename\n        endCursor\n        hasNextPage\n      }\n    }\n    friend_rankings {\n      __typename\n      ...RankingWithUser\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString).appending(RankingWithUser.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(game: Game) {
      self.init(snapshot: ["__typename": "Query", "game": game.snapshot])
    }

    public var game: Game {
      get {
        return Game(snapshot: snapshot["game"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "game")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
        GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
        GraphQLField("rankings", arguments: ["first": 30], type: .nonNull(.object(Ranking.selections))),
        GraphQLField("friend_rankings", type: .nonNull(.list(.nonNull(.object(FriendRanking.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, ports: [Port], rankings: Ranking, friendRankings: [FriendRanking]) {
        self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }, "rankings": rankings.snapshot, "friend_rankings": friendRankings.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var ports: [Port] {
        get {
          return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public var friendRankings: [FriendRanking] {
        get {
          return (snapshot["friend_rankings"] as! [Snapshot]).map { FriendRanking(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "friend_rankings")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var gameBasic: GameBasic {
          get {
            return GameBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium_image_url", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil, mediumImageUrl: String? = nil) {
          self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl, "medium_image_url": mediumImageUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var platform: Platform {
          get {
            return Platform(snapshot: snapshot["platform"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "platform")
          }
        }

        public var smallImageUrl: String? {
          get {
            return snapshot["small_image_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "small_image_url")
          }
        }

        public var mediumImageUrl: String? {
          get {
            return snapshot["medium_image_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "medium_image_url")
          }
        }

        public struct Platform: GraphQLSelectionSet {
          public static let possibleTypes = ["Platforms"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(node: Node? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "node": node.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, user: User) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var user: User {
              get {
                return User(snapshot: snapshot["user"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "user")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithUser: RankingWithUser {
                get {
                  return RankingWithUser(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes = ["User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
                GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, realName: String, photoUrl: String) {
                self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var realName: String {
                get {
                  return snapshot["real_name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "real_name")
                }
              }

              public var photoUrl: String {
                get {
                  return snapshot["photo_url"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "photo_url")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var userBasic: UserBasic {
                  get {
                    return UserBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }

      public struct FriendRanking: GraphQLSelectionSet {
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ranking", type: .scalar(Int.self)),
          GraphQLField("review", type: .scalar(String.self)),
          GraphQLField("verb", type: .nonNull(.scalar(String.self))),
          GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, user: User) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var ranking: Int? {
          get {
            return snapshot["ranking"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ranking")
          }
        }

        public var review: String? {
          get {
            return snapshot["review"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "review")
          }
        }

        public var verb: String {
          get {
            return snapshot["verb"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "verb")
          }
        }

        public var commentsCount: Int {
          get {
            return snapshot["comments_count"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "comments_count")
          }
        }

        public var shelves: [Shelf] {
          get {
            return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
          }
        }

        public var port: Port {
          get {
            return Port(snapshot: snapshot["port"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "port")
          }
        }

        public var user: User {
          get {
            return User(snapshot: snapshot["user"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "user")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var rankingWithUser: RankingWithUser {
            get {
              return RankingWithUser(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public var rankingBasic: RankingBasic {
            get {
              return RankingBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Shelf: GraphQLSelectionSet {
          public static let possibleTypes = ["Shelf"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var shelfBasic: ShelfBasic {
              get {
                return ShelfBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
            self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var platform: Platform {
            get {
              return Platform(snapshot: snapshot["platform"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "platform")
            }
          }

          public var smallImageUrl: String? {
            get {
              return snapshot["small_image_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "small_image_url")
            }
          }

          public struct Platform: GraphQLSelectionSet {
            public static let possibleTypes = ["Platforms"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, name: String) {
              self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, realName: String, photoUrl: String) {
            self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var realName: String {
            get {
              return snapshot["real_name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "real_name")
            }
          }

          public var photoUrl: String {
            get {
              return snapshot["photo_url"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "photo_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userBasic: UserBasic {
              get {
                return UserBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class GameRankingsQuery: GraphQLQuery {
  public static let operationString =
    "query GameRankings($id: ID!, $after: String) {\n  game(id: $id) {\n    __typename\n    rankings(first: 30, after: $after) {\n      __typename\n      edges {\n        __typename\n        ranking: node {\n          __typename\n          ...RankingWithUser\n        }\n      }\n      pageInfo {\n        __typename\n        endCursor\n        hasNextPage\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithUser.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(game: Game) {
      self.init(snapshot: ["__typename": "Query", "game": game.snapshot])
    }

    public var game: Game {
      get {
        return Game(snapshot: snapshot["game"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "game")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(rankings: Ranking) {
        self.init(snapshot: ["__typename": "Game", "rankings": rankings.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(ranking: Ranking? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, user: User) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var user: User {
              get {
                return User(snapshot: snapshot["user"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "user")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithUser: RankingWithUser {
                get {
                  return RankingWithUser(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes = ["User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
                GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, realName: String, photoUrl: String) {
                self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var realName: String {
                get {
                  return snapshot["real_name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "real_name")
                }
              }

              public var photoUrl: String {
                get {
                  return snapshot["photo_url"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "photo_url")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var userBasic: UserBasic {
                  get {
                    return UserBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  public static let operationString =
    "query Me {\n  user: me {\n    __typename\n    ...UserDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", alias: "user", type: .nonNull(.object(User.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User) {
      self.init(snapshot: ["__typename": "Query", "user": user.snapshot])
    }

    public var user: User {
      get {
        return User(snapshot: snapshot["user"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 10], type: .nonNull(.object(Ranking.selections))),
        GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, realName: String, photoUrl: String, rankings: Ranking, shelves: [Shelf]) {
        self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.snapshot, "shelves": shelves.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var realName: String {
        get {
          return snapshot["real_name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "real_name")
        }
      }

      public var photoUrl: String {
        get {
          return snapshot["photo_url"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "photo_url")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public var shelves: [Shelf] {
        get {
          return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetail: UserDetail {
          get {
            return UserDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public var userBasic: UserBasic {
          get {
            return UserBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(ranking: Ranking? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("game", type: .nonNull(.object(Game.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var game: Game {
              get {
                return Game(snapshot: snapshot["game"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "game")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Game: GraphQLSelectionSet {
              public static let possibleTypes = ["Game"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, ports: [Port]) {
                self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var ports: [Port] {
                get {
                  return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var gameBasic: GameBasic {
                  get {
                    return GameBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                  self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var platform: Platform {
                  get {
                    return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "platform")
                  }
                }

                public var smallImageUrl: String? {
                  get {
                    return snapshot["small_image_url"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "small_image_url")
                  }
                }

                public struct Platform: GraphQLSelectionSet {
                  public static let possibleTypes = ["Platforms"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, name: String) {
                    self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }

      public struct Shelf: GraphQLSelectionSet {
        public static let possibleTypes = ["Shelf"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String) {
          self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var shelfBasic: ShelfBasic {
            get {
              return ShelfBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class MyGamesQuery: GraphQLQuery {
  public static let operationString =
    "query MyGames($after: String) {\n  my_games(first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      ranking: node {\n        __typename\n        ...RankingWithGame\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(myGames: MyGame) {
      self.init(snapshot: ["__typename": "Query", "my_games": myGames.snapshot])
    }

    /// get games the current user has added
    public var myGames: MyGame {
      get {
        return MyGame(snapshot: snapshot["my_games"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "my_games")
      }
    }

    public struct MyGame: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(ranking: Ranking? = nil) {
          self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var ranking: Ranking? {
          get {
            return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
          }
        }

        public struct Ranking: GraphQLSelectionSet {
          public static let possibleTypes = ["Ranking"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("ranking", type: .scalar(Int.self)),
            GraphQLField("review", type: .scalar(String.self)),
            GraphQLField("verb", type: .nonNull(.scalar(String.self))),
            GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
            GraphQLField("port", type: .nonNull(.object(Port.selections))),
            GraphQLField("game", type: .nonNull(.object(Game.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
            self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var ranking: Int? {
            get {
              return snapshot["ranking"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "ranking")
            }
          }

          public var review: String? {
            get {
              return snapshot["review"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "review")
            }
          }

          public var verb: String {
            get {
              return snapshot["verb"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "verb")
            }
          }

          public var commentsCount: Int {
            get {
              return snapshot["comments_count"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "comments_count")
            }
          }

          public var shelves: [Shelf] {
            get {
              return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
            }
          }

          public var port: Port {
            get {
              return Port(snapshot: snapshot["port"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "port")
            }
          }

          public var game: Game {
            get {
              return Game(snapshot: snapshot["game"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "game")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var rankingWithGame: RankingWithGame {
              get {
                return RankingWithGame(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public var rankingBasic: RankingBasic {
              get {
                return RankingBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Shelf: GraphQLSelectionSet {
            public static let possibleTypes = ["Shelf"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, name: String) {
              self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var shelfBasic: ShelfBasic {
                get {
                  return ShelfBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
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

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
              self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var platform: Platform {
              get {
                return Platform(snapshot: snapshot["platform"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "platform")
              }
            }

            public var smallImageUrl: String? {
              get {
                return snapshot["small_image_url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "small_image_url")
              }
            }

            public struct Platform: GraphQLSelectionSet {
              public static let possibleTypes = ["Platforms"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct Game: GraphQLSelectionSet {
            public static let possibleTypes = ["Game"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, title: String, ports: [Port]) {
              self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var title: String {
              get {
                return snapshot["title"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "title")
              }
            }

            public var ports: [Port] {
              get {
                return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var gameBasic: GameBasic {
                get {
                  return GameBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return snapshot["endCursor"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class MyShelvesQuery: GraphQLQuery {
  public static let operationString =
    "query MyShelves {\n  shelves: my_shelves {\n    __typename\n    id\n    name\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("my_shelves", alias: "shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(shelves: [Shelf]) {
      self.init(snapshot: ["__typename": "Query", "shelves": shelves.map { $0.snapshot }])
    }

    public var shelves: [Shelf] {
      get {
        return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
      }
    }

    public struct Shelf: GraphQLSelectionSet {
      public static let possibleTypes = ["Shelf"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  public static let operationString =
    "query Search($query: String!, $after: String) {\n  search(query: $query, first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      game: node {\n        __typename\n        ...GameBasic\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(search: Search) {
      self.init(snapshot: ["__typename": "Query", "search": search.snapshot])
    }

    /// get games matching the query string
    public var search: Search {
      get {
        return Search(snapshot: snapshot["search"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["GameConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(snapshot: ["__typename": "GameConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["GameEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "game", type: .object(Game.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(game: Game? = nil) {
          self.init(snapshot: ["__typename": "GameEdge", "game": game.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var game: Game? {
          get {
            return (snapshot["game"] as? Snapshot).flatMap { Game(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "game")
          }
        }

        public struct Game: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, title: String, ports: [Port]) {
            self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var ports: [Port] {
            get {
              return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var gameBasic: GameBasic {
              get {
                return GameBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
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

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
              self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var platform: Platform {
              get {
                return Platform(snapshot: snapshot["platform"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "platform")
              }
            }

            public var smallImageUrl: String? {
              get {
                return snapshot["small_image_url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "small_image_url")
              }
            }

            public struct Platform: GraphQLSelectionSet {
              public static let possibleTypes = ["Platforms"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return snapshot["endCursor"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class ShelfQuery: GraphQLQuery {
  public static let operationString =
    "query Shelf($id: ID!, $after: String) {\n  shelf(id: $id) {\n    __typename\n    rankings(first: 30, after: $after) {\n      __typename\n      edges {\n        __typename\n        ranking: node {\n          __typename\n          ...RankingWithGame\n        }\n      }\n      pageInfo {\n        __typename\n        endCursor\n        hasNextPage\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(shelf: Shelf) {
      self.init(snapshot: ["__typename": "Query", "shelf": shelf.snapshot])
    }

    public var shelf: Shelf {
      get {
        return Shelf(snapshot: snapshot["shelf"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "shelf")
      }
    }

    public struct Shelf: GraphQLSelectionSet {
      public static let possibleTypes = ["Shelf"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(rankings: Ranking) {
        self.init(snapshot: ["__typename": "Shelf", "rankings": rankings.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(ranking: Ranking? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("game", type: .nonNull(.object(Game.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var game: Game {
              get {
                return Game(snapshot: snapshot["game"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "game")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Game: GraphQLSelectionSet {
              public static let possibleTypes = ["Game"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, ports: [Port]) {
                self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var ports: [Port] {
                get {
                  return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var gameBasic: GameBasic {
                  get {
                    return GameBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                  self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var platform: Platform {
                  get {
                    return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "platform")
                  }
                }

                public var smallImageUrl: String? {
                  get {
                    return snapshot["small_image_url"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "small_image_url")
                  }
                }

                public struct Platform: GraphQLSelectionSet {
                  public static let possibleTypes = ["Platforms"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, name: String) {
                    self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public final class UpdatesQuery: GraphQLQuery {
  public static let operationString =
    "query Updates($after: String) {\n  updates(first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      ranking: node {\n        __typename\n        ...RankingFull\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingFull.fragmentString).appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString).appending(UserBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updates: Update) {
      self.init(snapshot: ["__typename": "Query", "updates": updates.snapshot])
    }

    public var updates: Update {
      get {
        return Update(snapshot: snapshot["updates"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "updates")
      }
    }

    public struct Update: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(ranking: Ranking? = nil) {
          self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var ranking: Ranking? {
          get {
            return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
          }
        }

        public struct Ranking: GraphQLSelectionSet {
          public static let possibleTypes = ["Ranking"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("ranking", type: .scalar(Int.self)),
            GraphQLField("review", type: .scalar(String.self)),
            GraphQLField("verb", type: .nonNull(.scalar(String.self))),
            GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
            GraphQLField("port", type: .nonNull(.object(Port.selections))),
            GraphQLField("game", type: .nonNull(.object(Game.selections))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game, user: User) {
            self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot, "user": user.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var ranking: Int? {
            get {
              return snapshot["ranking"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "ranking")
            }
          }

          public var review: String? {
            get {
              return snapshot["review"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "review")
            }
          }

          public var verb: String {
            get {
              return snapshot["verb"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "verb")
            }
          }

          public var commentsCount: Int {
            get {
              return snapshot["comments_count"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "comments_count")
            }
          }

          public var shelves: [Shelf] {
            get {
              return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
            }
          }

          public var port: Port {
            get {
              return Port(snapshot: snapshot["port"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "port")
            }
          }

          public var game: Game {
            get {
              return Game(snapshot: snapshot["game"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "game")
            }
          }

          public var user: User {
            get {
              return User(snapshot: snapshot["user"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "user")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var rankingFull: RankingFull {
              get {
                return RankingFull(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public var rankingWithGame: RankingWithGame {
              get {
                return RankingWithGame(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public var rankingBasic: RankingBasic {
              get {
                return RankingBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Shelf: GraphQLSelectionSet {
            public static let possibleTypes = ["Shelf"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, name: String) {
              self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var shelfBasic: ShelfBasic {
                get {
                  return ShelfBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
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

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
              self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var platform: Platform {
              get {
                return Platform(snapshot: snapshot["platform"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "platform")
              }
            }

            public var smallImageUrl: String? {
              get {
                return snapshot["small_image_url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "small_image_url")
              }
            }

            public struct Platform: GraphQLSelectionSet {
              public static let possibleTypes = ["Platforms"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct Game: GraphQLSelectionSet {
            public static let possibleTypes = ["Game"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, title: String, ports: [Port]) {
              self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var title: String {
              get {
                return snapshot["title"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "title")
              }
            }

            public var ports: [Port] {
              get {
                return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var gameBasic: GameBasic {
                get {
                  return GameBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
              GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, realName: String, photoUrl: String) {
              self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var realName: String {
              get {
                return snapshot["real_name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "real_name")
              }
            }

            public var photoUrl: String {
              get {
                return snapshot["photo_url"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "photo_url")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var userBasic: UserBasic {
                get {
                  return UserBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(endCursor: String? = nil, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return snapshot["endCursor"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class UserQuery: GraphQLQuery {
  public static let operationString =
    "query User($id: ID!) {\n  user(id: $id) {\n    __typename\n    ...UserDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User) {
      self.init(snapshot: ["__typename": "Query", "user": user.snapshot])
    }

    public var user: User {
      get {
        return User(snapshot: snapshot["user"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 10], type: .nonNull(.object(Ranking.selections))),
        GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, realName: String, photoUrl: String, rankings: Ranking, shelves: [Shelf]) {
        self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.snapshot, "shelves": shelves.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var realName: String {
        get {
          return snapshot["real_name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "real_name")
        }
      }

      public var photoUrl: String {
        get {
          return snapshot["photo_url"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "photo_url")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public var shelves: [Shelf] {
        get {
          return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetail: UserDetail {
          get {
            return UserDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public var userBasic: UserBasic {
          get {
            return UserBasic(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
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

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(ranking: Ranking? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("game", type: .nonNull(.object(Game.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var game: Game {
              get {
                return Game(snapshot: snapshot["game"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "game")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Game: GraphQLSelectionSet {
              public static let possibleTypes = ["Game"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, ports: [Port]) {
                self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var ports: [Port] {
                get {
                  return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var gameBasic: GameBasic {
                  get {
                    return GameBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                  self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var platform: Platform {
                  get {
                    return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "platform")
                  }
                }

                public var smallImageUrl: String? {
                  get {
                    return snapshot["small_image_url"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "small_image_url")
                  }
                }

                public struct Platform: GraphQLSelectionSet {
                  public static let possibleTypes = ["Platforms"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, name: String) {
                    self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }

      public struct Shelf: GraphQLSelectionSet {
        public static let possibleTypes = ["Shelf"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String) {
          self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var shelfBasic: ShelfBasic {
            get {
              return ShelfBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class UserRankingsQuery: GraphQLQuery {
  public static let operationString =
    "query UserRankings($id: ID!, $after: String) {\n  user(id: $id) {\n    __typename\n    rankings(first: 30, after: $after) {\n      __typename\n      edges {\n        __typename\n        ranking: node {\n          __typename\n          ...RankingWithGame\n        }\n      }\n      pageInfo {\n        __typename\n        endCursor\n        hasNextPage\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithGame.fragmentString).appending(RankingBasic.fragmentString).appending(ShelfBasic.fragmentString).appending(GameBasic.fragmentString) }

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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User) {
      self.init(snapshot: ["__typename": "Query", "user": user.snapshot])
    }

    public var user: User {
      get {
        return User(snapshot: snapshot["user"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rankings", arguments: ["first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(Ranking.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(rankings: Ranking) {
        self.init(snapshot: ["__typename": "User", "rankings": rankings.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rankings: Ranking {
        get {
          return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "rankings")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["RankingConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RankingEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(ranking: Ranking? = nil) {
            self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var ranking: Ranking? {
            get {
              return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
            }
          }

          public struct Ranking: GraphQLSelectionSet {
            public static let possibleTypes = ["Ranking"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("ranking", type: .scalar(Int.self)),
              GraphQLField("review", type: .scalar(String.self)),
              GraphQLField("verb", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
              GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
              GraphQLField("port", type: .nonNull(.object(Port.selections))),
              GraphQLField("game", type: .nonNull(.object(Game.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
              self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var ranking: Int? {
              get {
                return snapshot["ranking"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "ranking")
              }
            }

            public var review: String? {
              get {
                return snapshot["review"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "review")
              }
            }

            public var verb: String {
              get {
                return snapshot["verb"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "verb")
              }
            }

            public var commentsCount: Int {
              get {
                return snapshot["comments_count"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "comments_count")
              }
            }

            public var shelves: [Shelf] {
              get {
                return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
              }
            }

            public var port: Port {
              get {
                return Port(snapshot: snapshot["port"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "port")
              }
            }

            public var game: Game {
              get {
                return Game(snapshot: snapshot["game"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "game")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var rankingWithGame: RankingWithGame {
                get {
                  return RankingWithGame(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var rankingBasic: RankingBasic {
                get {
                  return RankingBasic(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Shelf: GraphQLSelectionSet {
              public static let possibleTypes = ["Shelf"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var shelfBasic: ShelfBasic {
                  get {
                    return ShelfBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var platform: Platform {
                get {
                  return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                }
                set {
                  snapshot.updateValue(newValue.snapshot, forKey: "platform")
                }
              }

              public var smallImageUrl: String? {
                get {
                  return snapshot["small_image_url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "small_image_url")
                }
              }

              public struct Platform: GraphQLSelectionSet {
                public static let possibleTypes = ["Platforms"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String) {
                  self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return snapshot["name"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Game: GraphQLSelectionSet {
              public static let possibleTypes = ["Game"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, ports: [Port]) {
                self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var ports: [Port] {
                get {
                  return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var gameBasic: GameBasic {
                  get {
                    return GameBasic(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
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

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
                  self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                public var platform: Platform {
                  get {
                    return Platform(snapshot: snapshot["platform"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "platform")
                  }
                }

                public var smallImageUrl: String? {
                  get {
                    return snapshot["small_image_url"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "small_image_url")
                  }
                }

                public struct Platform: GraphQLSelectionSet {
                  public static let possibleTypes = ["Platforms"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, name: String) {
                    self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }
      }
    }
  }
}

public struct CommentBasic: GraphQLFragment {
  public static let fragmentString =
    "fragment CommentBasic on Comment {\n  __typename\n  id\n  comment\n  created_at\n  user {\n    __typename\n    ...UserBasic\n  }\n}"

  public static let possibleTypes = ["Comment"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("comment", type: .nonNull(.scalar(String.self))),
    GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, comment: String, createdAt: String, user: User) {
    self.init(snapshot: ["__typename": "Comment", "id": id, "comment": comment, "created_at": createdAt, "user": user.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var comment: String {
    get {
      return snapshot["comment"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "comment")
    }
  }

  public var createdAt: String {
    get {
      return snapshot["created_at"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "created_at")
    }
  }

  public var user: User {
    get {
      return User(snapshot: snapshot["user"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "user")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var realName: String {
      get {
        return snapshot["real_name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "real_name")
      }
    }

    public var photoUrl: String {
      get {
        return snapshot["photo_url"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "photo_url")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userBasic: UserBasic {
        get {
          return UserBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct GameBasic: GraphQLFragment {
  public static let fragmentString =
    "fragment GameBasic on Game {\n  __typename\n  id\n  title\n  ports {\n    __typename\n    id\n    platform {\n      __typename\n      id\n      name\n    }\n    small_image_url\n  }\n}"

  public static let possibleTypes = ["Game"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, title: String, ports: [Port]) {
    self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return snapshot["title"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "title")
    }
  }

  public var ports: [Port] {
    get {
      return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(snapshot: snapshot["platform"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return snapshot["small_image_url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platforms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct RankingBasic: GraphQLFragment {
  public static let fragmentString =
    "fragment RankingBasic on Ranking {\n  __typename\n  id\n  ranking\n  review\n  verb\n  comments_count\n  shelves {\n    __typename\n    ...ShelfBasic\n  }\n  port {\n    __typename\n    id\n    platform {\n      __typename\n      id\n      name\n    }\n    small_image_url\n  }\n}"

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var ranking: Int? {
    get {
      return snapshot["ranking"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "ranking")
    }
  }

  public var review: String? {
    get {
      return snapshot["review"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "review")
    }
  }

  public var verb: String {
    get {
      return snapshot["verb"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "verb")
    }
  }

  public var commentsCount: Int {
    get {
      return snapshot["comments_count"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
    }
  }

  public var port: Port {
    get {
      return Port(snapshot: snapshot["port"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "port")
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String) {
      self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(snapshot: snapshot["platform"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return snapshot["small_image_url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platforms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct RankingFull: GraphQLFragment {
  public static let fragmentString =
    "fragment RankingFull on Ranking {\n  __typename\n  ...RankingWithGame\n  user {\n    __typename\n    ...UserBasic\n  }\n}"

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
    GraphQLField("game", type: .nonNull(.object(Game.selections))),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game, user: User) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot, "user": user.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var ranking: Int? {
    get {
      return snapshot["ranking"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "ranking")
    }
  }

  public var review: String? {
    get {
      return snapshot["review"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "review")
    }
  }

  public var verb: String {
    get {
      return snapshot["verb"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "verb")
    }
  }

  public var commentsCount: Int {
    get {
      return snapshot["comments_count"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
    }
  }

  public var port: Port {
    get {
      return Port(snapshot: snapshot["port"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "port")
    }
  }

  public var game: Game {
    get {
      return Game(snapshot: snapshot["game"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "game")
    }
  }

  public var user: User {
    get {
      return User(snapshot: snapshot["user"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "user")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  public struct Fragments {
    public var snapshot: Snapshot

    public var rankingWithGame: RankingWithGame {
      get {
        return RankingWithGame(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public var rankingBasic: RankingBasic {
      get {
        return RankingBasic(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String) {
      self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(snapshot: snapshot["platform"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return snapshot["small_image_url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platforms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }

  public struct Game: GraphQLSelectionSet {
    public static let possibleTypes = ["Game"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, title: String, ports: [Port]) {
      self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var title: String {
      get {
        return snapshot["title"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "title")
      }
    }

    public var ports: [Port] {
      get {
        return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var gameBasic: GameBasic {
        get {
          return GameBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
        self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var platform: Platform {
        get {
          return Platform(snapshot: snapshot["platform"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "platform")
        }
      }

      public var smallImageUrl: String? {
        get {
          return snapshot["small_image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_image_url")
        }
      }

      public struct Platform: GraphQLSelectionSet {
        public static let possibleTypes = ["Platforms"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String) {
          self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var realName: String {
      get {
        return snapshot["real_name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "real_name")
      }
    }

    public var photoUrl: String {
      get {
        return snapshot["photo_url"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "photo_url")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userBasic: UserBasic {
        get {
          return UserBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct RankingWithGame: GraphQLFragment {
  public static let fragmentString =
    "fragment RankingWithGame on Ranking {\n  __typename\n  ...RankingBasic\n  game {\n    __typename\n    ...GameBasic\n  }\n}"

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
    GraphQLField("game", type: .nonNull(.object(Game.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var ranking: Int? {
    get {
      return snapshot["ranking"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "ranking")
    }
  }

  public var review: String? {
    get {
      return snapshot["review"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "review")
    }
  }

  public var verb: String {
    get {
      return snapshot["verb"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "verb")
    }
  }

  public var commentsCount: Int {
    get {
      return snapshot["comments_count"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
    }
  }

  public var port: Port {
    get {
      return Port(snapshot: snapshot["port"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "port")
    }
  }

  public var game: Game {
    get {
      return Game(snapshot: snapshot["game"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "game")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  public struct Fragments {
    public var snapshot: Snapshot

    public var rankingBasic: RankingBasic {
      get {
        return RankingBasic(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String) {
      self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(snapshot: snapshot["platform"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return snapshot["small_image_url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platforms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }

  public struct Game: GraphQLSelectionSet {
    public static let possibleTypes = ["Game"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, title: String, ports: [Port]) {
      self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var title: String {
      get {
        return snapshot["title"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "title")
      }
    }

    public var ports: [Port] {
      get {
        return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var gameBasic: GameBasic {
        get {
          return GameBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
        self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var platform: Platform {
        get {
          return Platform(snapshot: snapshot["platform"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "platform")
        }
      }

      public var smallImageUrl: String? {
        get {
          return snapshot["small_image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_image_url")
        }
      }

      public struct Platform: GraphQLSelectionSet {
        public static let possibleTypes = ["Platforms"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String) {
          self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public struct RankingWithUser: GraphQLFragment {
  public static let fragmentString =
    "fragment RankingWithUser on Ranking {\n  __typename\n  ...RankingBasic\n  user {\n    __typename\n    ...UserBasic\n  }\n}"

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, user: User) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var ranking: Int? {
    get {
      return snapshot["ranking"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "ranking")
    }
  }

  public var review: String? {
    get {
      return snapshot["review"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "review")
    }
  }

  public var verb: String {
    get {
      return snapshot["verb"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "verb")
    }
  }

  public var commentsCount: Int {
    get {
      return snapshot["comments_count"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
    }
  }

  public var port: Port {
    get {
      return Port(snapshot: snapshot["port"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "port")
    }
  }

  public var user: User {
    get {
      return User(snapshot: snapshot["user"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "user")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  public struct Fragments {
    public var snapshot: Snapshot

    public var rankingBasic: RankingBasic {
      get {
        return RankingBasic(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String) {
      self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
      self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var platform: Platform {
      get {
        return Platform(snapshot: snapshot["platform"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "platform")
      }
    }

    public var smallImageUrl: String? {
      get {
        return snapshot["small_image_url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "small_image_url")
      }
    }

    public struct Platform: GraphQLSelectionSet {
      public static let possibleTypes = ["Platforms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, realName: String, photoUrl: String) {
      self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var realName: String {
      get {
        return snapshot["real_name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "real_name")
      }
    }

    public var photoUrl: String {
      get {
        return snapshot["photo_url"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "photo_url")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userBasic: UserBasic {
        get {
          return UserBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct ShelfBasic: GraphQLFragment {
  public static let fragmentString =
    "fragment ShelfBasic on Shelf {\n  __typename\n  id\n  name\n}"

  public static let possibleTypes = ["Shelf"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String) {
    self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }
}

public struct UserBasic: GraphQLFragment {
  public static let fragmentString =
    "fragment UserBasic on User {\n  __typename\n  id\n  real_name\n  photo_url\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
    GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, realName: String, photoUrl: String) {
    self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var realName: String {
    get {
      return snapshot["real_name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "real_name")
    }
  }

  public var photoUrl: String {
    get {
      return snapshot["photo_url"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "photo_url")
    }
  }
}

public struct UserDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment UserDetail on User {\n  __typename\n  ...UserBasic\n  rankings(first: 10) {\n    __typename\n    edges {\n      __typename\n      ranking: node {\n        __typename\n        ...RankingWithGame\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n  shelves {\n    __typename\n    ...ShelfBasic\n  }\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
    GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
    GraphQLField("rankings", arguments: ["first": 10], type: .nonNull(.object(Ranking.selections))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, realName: String, photoUrl: String, rankings: Ranking, shelves: [Shelf]) {
    self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.snapshot, "shelves": shelves.map { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var realName: String {
    get {
      return snapshot["real_name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "real_name")
    }
  }

  public var photoUrl: String {
    get {
      return snapshot["photo_url"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "photo_url")
    }
  }

  public var rankings: Ranking {
    get {
      return Ranking(snapshot: snapshot["rankings"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "rankings")
    }
  }

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  public struct Fragments {
    public var snapshot: Snapshot

    public var userBasic: UserBasic {
      get {
        return UserBasic(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
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

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
      self.init(snapshot: ["__typename": "RankingConnection", "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "pageInfo": pageInfo.snapshot])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of edges.
    public var edges: [Edge?]? {
      get {
        return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
      }
    }

    /// Information to aid in pagination.
    public var pageInfo: PageInfo {
      get {
        return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes = ["RankingEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", alias: "ranking", type: .object(Ranking.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(ranking: Ranking? = nil) {
        self.init(snapshot: ["__typename": "RankingEdge", "ranking": ranking.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge.
      public var ranking: Ranking? {
        get {
          return (snapshot["ranking"] as? Snapshot).flatMap { Ranking(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "ranking")
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ranking", type: .scalar(Int.self)),
          GraphQLField("review", type: .scalar(String.self)),
          GraphQLField("verb", type: .nonNull(.scalar(String.self))),
          GraphQLField("comments_count", type: .nonNull(.scalar(Int.self))),
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("game", type: .nonNull(.object(Game.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, commentsCount: Int, shelves: [Shelf], port: Port, game: Game) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "comments_count": commentsCount, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "game": game.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var ranking: Int? {
          get {
            return snapshot["ranking"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ranking")
          }
        }

        public var review: String? {
          get {
            return snapshot["review"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "review")
          }
        }

        public var verb: String {
          get {
            return snapshot["verb"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "verb")
          }
        }

        public var commentsCount: Int {
          get {
            return snapshot["comments_count"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "comments_count")
          }
        }

        public var shelves: [Shelf] {
          get {
            return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
          }
        }

        public var port: Port {
          get {
            return Port(snapshot: snapshot["port"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "port")
          }
        }

        public var game: Game {
          get {
            return Game(snapshot: snapshot["game"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "game")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var rankingWithGame: RankingWithGame {
            get {
              return RankingWithGame(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public var rankingBasic: RankingBasic {
            get {
              return RankingBasic(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Shelf: GraphQLSelectionSet {
          public static let possibleTypes = ["Shelf"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var shelfBasic: ShelfBasic {
              get {
                return ShelfBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
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

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
            self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var platform: Platform {
            get {
              return Platform(snapshot: snapshot["platform"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "platform")
            }
          }

          public var smallImageUrl: String? {
            get {
              return snapshot["small_image_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "small_image_url")
            }
          }

          public struct Platform: GraphQLSelectionSet {
            public static let possibleTypes = ["Platforms"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, name: String) {
              self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct Game: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("ports", type: .nonNull(.list(.nonNull(.object(Port.selections))))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, title: String, ports: [Port]) {
            self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var ports: [Port] {
            get {
              return (snapshot["ports"] as! [Snapshot]).map { Port(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "ports")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var gameBasic: GameBasic {
              get {
                return GameBasic(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
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

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil) {
              self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var platform: Platform {
              get {
                return Platform(snapshot: snapshot["platform"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "platform")
              }
            }

            public var smallImageUrl: String? {
              get {
                return snapshot["small_image_url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "small_image_url")
              }
            }

            public struct Platform: GraphQLSelectionSet {
              public static let possibleTypes = ["Platforms"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: String) {
                self.init(snapshot: ["__typename": "Platforms", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
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

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(endCursor: String? = nil, hasNextPage: Bool) {
        self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// When paginating forwards, the cursor to continue.
      public var endCursor: String? {
        get {
          return snapshot["endCursor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endCursor")
        }
      }

      /// When paginating forwards, are there more items?
      public var hasNextPage: Bool {
        get {
          return snapshot["hasNextPage"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "hasNextPage")
        }
      }
    }
  }

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String) {
      self.init(snapshot: ["__typename": "Shelf", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var shelfBasic: ShelfBasic {
        get {
          return ShelfBasic(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}