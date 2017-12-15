import Foundation
import Apollo

let api = GamerankrAPI()

protocol APIErrorDelegate {
    func handleApi(error: String)
}
protocol APISearchResultsDelegate : APIErrorDelegate {
    func handleAPISearch(results: [SearchQuery.Data.Search])
}

protocol APIMyGamesDelegate : APIErrorDelegate {
    func handleAPIMyGames(rankings: [MyGamesQuery.Data.MyGame])
}


class GamerankrAPI {
    
    public private(set) var signed_in = false
    let base_url = "http://localhost:3000"
//    let base_url = "https://www.gamerankr.com"
    let apollo: ApolloClient
    let session: URLSession
    
    init() {
        let transport = GamerankerHTTPNetworkTransport(url: URL(string: "\(base_url)/graphql")!)
        session = transport.session
        apollo = ApolloClient(networkTransport: transport)
    }

    func login(fbAuthToken: String, delegate: APIErrorDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "fb_auth_token", value: fbAuthToken)
        ]
        
        let task = session.dataTask(with: urlComponents.url!) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            NSLog("login was successful. Data: \(String(describing: data))")
            self.signed_in = true
            // success!
        }
        task.resume()
    }

    func search(query: String, delegate: APISearchResultsDelegate) {
        apollo.fetch(query: SearchQuery(query: query)) { (result, error) in
            guard let data = result?.data else { return }
            delegate.handleAPISearch(results: data.search! as! [SearchQuery.Data.Search])
        }
    }

    func getMyGames(delegate: APIMyGamesDelegate) {
        
        apollo.fetch(query: MyGamesQuery()) { (result, error) in
            guard let data = result?.data else { return }
            delegate.handleAPIMyGames(rankings: data.myGames! as! [MyGamesQuery.Data.MyGame])
        }
    }
    
    private func handleAPIErrorsBasic(data: Data?, response: URLResponse?, error: Error?, apiErrorDelegate: APIErrorDelegate) -> Bool {
        if let error = error {
            apiErrorDelegate.handleApi(error: "error: \(error)")
            return false
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            apiErrorDelegate.handleApi(error: "server error, response: \(String(describing: response))")
            return false
        }
        return true
    }
    
//    private func parseListOfGames(games_raw: Any?) -> [Game] {
//        let games_raw_cast = games_raw as! [[String:Any]]
//
//        var games: [Game] = []
//        for game_raw in games_raw_cast {
//            games.append(Game(id: game_raw["id"] as! String, title: game_raw["title"] as! String))
//        }
//        return games
//    }
}

