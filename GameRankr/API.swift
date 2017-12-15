//  This file was automatically generated and should not be edited.

import Apollo

public final class MyGamesQuery: GraphQLQuery {
  public static let operationString =
    "query MyGames {\n  rankings: my_games {\n    __typename\n    id\n    ranking\n    game {\n      __typename\n      id\n      title\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("my_games", alias: "rankings", type: .nonNull(.list(.object(Ranking.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(rankings: [Ranking?]) {
      self.init(snapshot: ["__typename": "Query", "rankings": rankings.map { $0.flatMap { $0.snapshot } }])
    }

    /// get games the current user has added
    public var rankings: [Ranking?] {
      get {
        return (snapshot["rankings"] as! [Snapshot?]).map { $0.flatMap { Ranking(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "rankings")
      }
    }

    public struct Ranking: GraphQLSelectionSet {
      public static let possibleTypes = ["Ranking"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ranking", type: .scalar(Int.self)),
        GraphQLField("game", type: .nonNull(.object(Game.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, ranking: Int? = nil, game: Game) {
        self.init(snapshot: ["__typename": "Ranking", "id": id, "ranking": ranking, "game": game.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
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

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, title: String) {
          self.init(snapshot: ["__typename": "Game", "id": id, "title": title])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
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
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  public static let operationString =
    "query Search($query: String!) {\n  games: search(query: $query) {\n    __typename\n    id\n    title\n  }\n}"

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
      GraphQLField("search", alias: "games", arguments: ["query": GraphQLVariable("query")], type: .nonNull(.list(.object(Game.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(games: [Game?]) {
      self.init(snapshot: ["__typename": "Query", "games": games.map { $0.flatMap { $0.snapshot } }])
    }

    /// get games matching the query string
    public var games: [Game?] {
      get {
        return (snapshot["games"] as! [Snapshot?]).map { $0.flatMap { Game(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "games")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String) {
        self.init(snapshot: ["__typename": "Game", "id": id, "title": title])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
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
    }
  }
}