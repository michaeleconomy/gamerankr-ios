//  This file was automatically generated and should not be edited.

import Apollo

public final class GameQuery: GraphQLQuery {
  public static let operationString =
    "query Game($id: ID!) {\n  game(id: $id) {\n    __typename\n    ...GameBasic\n    ports {\n      __typename\n      large_image_url\n    }\n    rankings {\n      __typename\n      id\n      ranking\n      review\n      user {\n        __typename\n        id\n        real_name\n        photo_url\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString) }

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
        GraphQLField("rankings", type: .nonNull(.list(.nonNull(.object(Ranking.selections))))),
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
          GraphQLField("large_image_url", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, platform: Platform, smallImageUrl: String? = nil, largeImageUrl: String? = nil) {
          self.init(snapshot: ["__typename": "Port", "id": id, "platform": platform.snapshot, "small_image_url": smallImageUrl, "large_image_url": largeImageUrl])
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

        public var largeImageUrl: String? {
          get {
            return snapshot["large_image_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "large_image_url")
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
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, ranking: Int? = nil, review: String? = nil, user: User) {
          self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "review": review, "user": user.snapshot])
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
      }
    }
  }
}

public final class MyGamesQuery: GraphQLQuery {
  public static let operationString =
    "query MyGames {\n  rankings: my_games {\n    __typename\n    id\n    ranking\n    game {\n      __typename\n      ...GameBasic\n    }\n    port {\n      __typename\n      id\n      small_image_url\n      platform {\n        __typename\n        id\n        name\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(GameBasic.fragmentString) }

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ranking", type: .scalar(Int.self)),
        GraphQLField("game", type: .nonNull(.object(Game.selections))),
        GraphQLField("port", type: .nonNull(.object(Port.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, ranking: Int? = nil, game: Game, port: Port) {
        self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "game": game.snapshot, "port": port.snapshot])
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

      public var game: Game {
        get {
          return Game(snapshot: snapshot["game"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "game")
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

      public struct Port: GraphQLSelectionSet {
        public static let possibleTypes = ["Port"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("small_image_url", type: .scalar(String.self)),
          GraphQLField("platform", type: .nonNull(.object(Platform.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, smallImageUrl: String? = nil, platform: Platform) {
          self.init(snapshot: ["__typename": "Port", "id": id, "small_image_url": smallImageUrl, "platform": platform.snapshot])
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

        public var smallImageUrl: String? {
          get {
            return snapshot["small_image_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "small_image_url")
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