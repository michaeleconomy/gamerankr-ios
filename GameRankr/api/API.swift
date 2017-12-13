//
//  API.swift
//  GameRankr
//
//  Created by Michael on 12/11/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
let api = API()

protocol APIErrorDelegate {
    func handleApi(error: String)
}
protocol APISearchResultsDelegate : APIErrorDelegate {
    func handleAPISearch(results: [Game])
}

protocol APIMyGamesDelegate : APIErrorDelegate {
    func handleAPIMyGames(games: [Game])
}


class API {
    let base_url = "http://localhost:3000"
//    let base_url = "https://www.gamerankr.com"
    
    public private(set) var signed_in = false
    
    func login(fbAuthToken: String, delegate: APIErrorDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "fb_auth_token", value: fbAuthToken)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
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
        var urlComponents = URLComponents(string: "\(base_url)/search.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                
                
                delegate.handleAPISearch(results: self.parseListOfGames(games_raw: json["results"]))
            } catch {
                delegate.handleApi(error: "error parsing json: \(error)")
            }
        }
        task.resume()
    }
    
    func getMyGames(delegate: APIMyGamesDelegate) {
        let urlComponents = URLComponents(string: "\(base_url)/my_games.json")!
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                
                delegate.handleAPIMyGames(games: self.parseListOfGames(games_raw: json["games"]))
            } catch {
                delegate.handleApi(error: "error parsing json: \(error)")
            }
        }
        task.resume()
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
    
    private func parseListOfGames(games_raw: Any?) -> [Game] {
        let games_raw_cast = games_raw as! [[String:Any]]
        
        var games: [Game] = []
        for game_raw in games_raw_cast {
            games.append(Game(id: game_raw["id"] as! String, title: game_raw["title"] as! String))
        }
        return games
    }
}

