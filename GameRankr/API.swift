//  This file was automatically generated and should not be edited.

import Apollo

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
    "query Game($id: ID!, $limit: Int) {\n  game(id: $id) {\n    __typename\n    ...GameBasic\n    ports {\n      __typename\n      medium_image_url\n    }\n    rankings(limit: $limit) {\n      __typename\n      id\n      ranking\n      review\n      verb\n      shelves {\n        __typename\n        name\n      }\n      port {\n        __typename\n        id\n      }\n      user {\n        __typename\n        ...UserBasic\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString).appending(UserBasic.fragmentString) }

  public var id: GraphQLID
  public var limit: Int?

  public init(id: GraphQLID, limit: Int? = nil) {
    self.id = id
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["id": id, "limit": limit]
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
        GraphQLField("rankings", arguments: ["limit": GraphQLVariable("limit")], type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, ports: [Port], rankings: [Ranking]) {
        self.init(snapshot: ["__typename": "Game", "id": id, "title": title, "ports": ports.map { $0.snapshot }, "rankings": rankings.map { $0.snapshot }])
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

      public var rankings: [Ranking] {
        get {
          return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ranking", type: .scalar(Int.self)),
          GraphQLField("review", type: .scalar(String.self)),
          GraphQLField("verb", type: .nonNull(.scalar(String.self))),
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, shelves: [Shelf], port: Port, user: User) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
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

        public struct Shelf: GraphQLSelectionSet {
          public static let possibleTypes = ["Shelf"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String) {
            self.init(snapshot: ["__typename": "Shelf", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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

        public struct Port: GraphQLSelectionSet {
          public static let possibleTypes = ["Port"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID) {
            self.init(snapshot: ["__typename": "Port", "id": id])
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

public final class MeQuery: GraphQLQuery {
  public static let operationString =
    "query Me {\n  user: me {\n    __typename\n    ...UserDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(RankingBasic.fragmentString).appending(GameBasic.fragmentString) }

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
        GraphQLField("rankings", arguments: ["limit": 5], type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
        GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, realName: String, photoUrl: String, rankings: [Ranking], shelves: [Shelf]) {
        self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.map { $0.snapshot }, "shelves": shelves.map { $0.snapshot }])
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

      public var rankings: [Ranking] {
        get {
          return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ranking", type: .scalar(Int.self)),
          GraphQLField("review", type: .scalar(String.self)),
          GraphQLField("verb", type: .nonNull(.scalar(String.self))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("game", type: .nonNull(.object(Game.selections))),
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf]) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }])
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

          public var rankingBasic: RankingBasic {
            get {
              return RankingBasic(snapshot: snapshot)
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

        public struct Shelf: GraphQLSelectionSet {
          public static let possibleTypes = ["Shelf"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String) {
            self.init(snapshot: ["__typename": "Shelf", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
}

public final class MyGamesQuery: GraphQLQuery {
  public static let operationString =
    "query MyGames($after: String) {\n  my_games(first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      ranking: node {\n        __typename\n        ...RankingBasic\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingBasic.fragmentString).appending(GameBasic.fragmentString) }

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
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("ranking", type: .scalar(Int.self)),
            GraphQLField("review", type: .scalar(String.self)),
            GraphQLField("verb", type: .nonNull(.scalar(String.self))),
            GraphQLField("port", type: .nonNull(.object(Port.selections))),
            GraphQLField("game", type: .nonNull(.object(Game.selections))),
            GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf]) {
            self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }])
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

            public var rankingBasic: RankingBasic {
              get {
                return RankingBasic(snapshot: snapshot)
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

          public struct Shelf: GraphQLSelectionSet {
            public static let possibleTypes = ["Shelf"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String) {
              self.init(snapshot: ["__typename": "Shelf", "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
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
    "query Search($query: String!) {\n  games: search(query: $query) {\n    __typename\n    ...GameBasic\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString) }

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", alias: "games", arguments: ["query": GraphQLVariable("query")], type: .nonNull(.list(.nonNull(.object(Game.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(games: [Game]) {
      self.init(snapshot: ["__typename": "Query", "games": games.map { $0.snapshot }])
    }

    /// get games matching the query string
    public var games: [Game] {
      get {
        return (snapshot["games"] as! [Snapshot]).map { Game(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "games")
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

public final class UpdatesQuery: GraphQLQuery {
  public static let operationString =
    "query Updates($after: String) {\n  updates(first: 30, after: $after) {\n    __typename\n    edges {\n      __typename\n      ranking: node {\n        __typename\n        ...RankingWithUser\n      }\n    }\n    pageInfo {\n      __typename\n      endCursor\n      hasNextPage\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RankingWithUser.fragmentString).appending(RankingBasic.fragmentString).appending(GameBasic.fragmentString).appending(UserBasic.fragmentString) }

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
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("ranking", type: .scalar(Int.self)),
            GraphQLField("review", type: .scalar(String.self)),
            GraphQLField("verb", type: .nonNull(.scalar(String.self))),
            GraphQLField("port", type: .nonNull(.object(Port.selections))),
            GraphQLField("game", type: .nonNull(.object(Game.selections))),
            GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf], user: User) {
            self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }, "user": user.snapshot])
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

          public var shelves: [Shelf] {
            get {
              return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
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

          public struct Shelf: GraphQLSelectionSet {
            public static let possibleTypes = ["Shelf"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String) {
              self.init(snapshot: ["__typename": "Shelf", "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
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

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(RankingBasic.fragmentString).appending(GameBasic.fragmentString) }

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
        GraphQLField("rankings", arguments: ["limit": 5], type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
        GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, realName: String, photoUrl: String, rankings: [Ranking], shelves: [Shelf]) {
        self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.map { $0.snapshot }, "shelves": shelves.map { $0.snapshot }])
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

      public var rankings: [Ranking] {
        get {
          return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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
        public static let possibleTypes = ["Ranking"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ranking", type: .scalar(Int.self)),
          GraphQLField("review", type: .scalar(String.self)),
          GraphQLField("verb", type: .nonNull(.scalar(String.self))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("game", type: .nonNull(.object(Game.selections))),
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf]) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }])
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

          public var rankingBasic: RankingBasic {
            get {
              return RankingBasic(snapshot: snapshot)
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

        public struct Shelf: GraphQLSelectionSet {
          public static let possibleTypes = ["Shelf"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String) {
            self.init(snapshot: ["__typename": "Shelf", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
    "fragment RankingBasic on Ranking {\n  __typename\n  id\n  ranking\n  review\n  verb\n  port {\n    __typename\n    id\n    platform {\n      __typename\n      id\n      name\n    }\n    small_image_url\n  }\n  game {\n    __typename\n    ...GameBasic\n  }\n  shelves {\n    __typename\n    name\n  }\n}"

  public static let possibleTypes = ["Ranking"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ranking", type: .scalar(Int.self)),
    GraphQLField("review", type: .scalar(String.self)),
    GraphQLField("verb", type: .nonNull(.scalar(String.self))),
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
    GraphQLField("game", type: .nonNull(.object(Game.selections))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf]) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }])
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

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
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

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String) {
      self.init(snapshot: ["__typename": "Shelf", "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
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
    GraphQLField("port", type: .nonNull(.object(Port.selections))),
    GraphQLField("game", type: .nonNull(.object(Game.selections))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf], user: User) {
    self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }, "user": user.snapshot])
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

  public var shelves: [Shelf] {
    get {
      return (snapshot["shelves"] as! [Snapshot]).map { Shelf(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "shelves")
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

  public struct Shelf: GraphQLSelectionSet {
    public static let possibleTypes = ["Shelf"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String) {
      self.init(snapshot: ["__typename": "Shelf", "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
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
    "fragment UserDetail on User {\n  __typename\n  ...UserBasic\n  rankings(limit: 5) {\n    __typename\n    ...RankingBasic\n  }\n  shelves {\n    __typename\n    id\n    name\n  }\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("real_name", type: .nonNull(.scalar(String.self))),
    GraphQLField("photo_url", type: .nonNull(.scalar(String.self))),
    GraphQLField("rankings", arguments: ["limit": 5], type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
    GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, realName: String, photoUrl: String, rankings: [Ranking], shelves: [Shelf]) {
    self.init(snapshot: ["__typename": "User", "id": id, "real_name": realName, "photo_url": photoUrl, "rankings": rankings.map { $0.snapshot }, "shelves": shelves.map { $0.snapshot }])
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

  public var rankings: [Ranking] {
    get {
      return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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
    public static let possibleTypes = ["Ranking"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("ranking", type: .scalar(Int.self)),
      GraphQLField("review", type: .scalar(String.self)),
      GraphQLField("verb", type: .nonNull(.scalar(String.self))),
      GraphQLField("port", type: .nonNull(.object(Port.selections))),
      GraphQLField("game", type: .nonNull(.object(Game.selections))),
      GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, verb: String, port: Port, game: Game, shelves: [Shelf]) {
      self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "verb": verb, "port": port.snapshot, "game": game.snapshot, "shelves": shelves.map { $0.snapshot }])
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

      public var rankingBasic: RankingBasic {
        get {
          return RankingBasic(snapshot: snapshot)
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

    public struct Shelf: GraphQLSelectionSet {
      public static let possibleTypes = ["Shelf"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String) {
        self.init(snapshot: ["__typename": "Shelf", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
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