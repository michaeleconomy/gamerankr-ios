//  This file was automatically generated and should not be edited.

import Apollo

public final class FriendsQuery: GraphQLQuery {
  public static let operationString =
    "query Friends($limit: Int, $offset: Int) {\n  users: friends(limit: $limit, offset: $offset) {\n    __typename\n    ...UserBasic\n  }\n}"

  public static var requestString: String { return operationString.appending(UserBasic.fragmentString) }

  public var limit: Int?
  public var offset: Int?

  public init(limit: Int? = nil, offset: Int? = nil) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("friends", alias: "users", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(User.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(users: [User]) {
      self.init(snapshot: ["__typename": "Query", "users": users.map { $0.snapshot }])
    }

    public var users: [User] {
      get {
        return (snapshot["users"] as! [Snapshot]).map { User(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "users")
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

public final class GameQuery: GraphQLQuery {
  public static let operationString =
    "query Game($id: ID!, $limit: Int) {\n  game(id: $id) {\n    __typename\n    ...GameBasic\n    ports {\n      __typename\n      medium_image_url\n    }\n    rankings(limit: $limit) {\n      __typename\n      id\n      ranking\n      review\n      shelves {\n        __typename\n        name\n      }\n      port {\n        __typename\n        id\n      }\n      user {\n        __typename\n        ...UserBasic\n      }\n    }\n  }\n}"

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
          GraphQLField("shelves", type: .nonNull(.list(.nonNull(.object(Shelf.selections))))),
          GraphQLField("port", type: .nonNull(.object(Port.selections))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, shelves: [Shelf], port: Port, user: User) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "shelves": shelves.map { $0.snapshot }, "port": port.snapshot, "user": user.snapshot])
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

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(Ranking.fragmentString).appending(GameBasic.fragmentString) }

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

          public var ranking: Ranking {
            get {
              return Ranking(snapshot: snapshot)
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
    "query MyGames {\n  rankings: my_games {\n    __typename\n    ...Ranking\n  }\n}"

  public static var requestString: String { return operationString.appending(Ranking.fragmentString).appending(GameBasic.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("my_games", alias: "rankings", type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(rankings: [Ranking]) {
      self.init(snapshot: ["__typename": "Query", "rankings": rankings.map { $0.snapshot }])
    }

    /// get games the current user has added
    public var rankings: [Ranking] {
      get {
        return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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

        public var ranking: Ranking {
          get {
            return Ranking(snapshot: snapshot)
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
    "query Updates {\n  rankings: updates {\n    __typename\n    ...Ranking\n    user {\n      __typename\n      ...UserBasic\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(Ranking.fragmentString).appending(GameBasic.fragmentString).appending(UserBasic.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updates", alias: "rankings", type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(rankings: [Ranking]) {
      self.init(snapshot: ["__typename": "Query", "rankings": rankings.map { $0.snapshot }])
    }

    public var rankings: [Ranking] {
      get {
        return (snapshot["rankings"] as! [Snapshot]).map { Ranking(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "rankings")
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

        public var ranking: Ranking {
          get {
            return Ranking(snapshot: snapshot)
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
}

public final class UserQuery: GraphQLQuery {
  public static let operationString =
    "query User($id: ID!) {\n  user(id: $id) {\n    __typename\n    ...UserDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetail.fragmentString).appending(UserBasic.fragmentString).appending(Ranking.fragmentString).appending(GameBasic.fragmentString) }

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

          public var ranking: Ranking {
            get {
              return Ranking(snapshot: snapshot)
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

public struct Ranking: GraphQLFragment {
  public static let fragmentString =
    "fragment Ranking on Ranking {\n  __typename\n  id\n  ranking\n  review\n  verb\n  port {\n    __typename\n    id\n    platform {\n      __typename\n      id\n      name\n    }\n    small_image_url\n  }\n  game {\n    __typename\n    ...GameBasic\n  }\n  shelves {\n    __typename\n    name\n  }\n}"

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
    "fragment UserDetail on User {\n  __typename\n  ...UserBasic\n  rankings(limit: 5) {\n    __typename\n    ...Ranking\n  }\n  shelves {\n    __typename\n    id\n    name\n  }\n}"

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

      public var ranking: Ranking {
        get {
          return Ranking(snapshot: snapshot)
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