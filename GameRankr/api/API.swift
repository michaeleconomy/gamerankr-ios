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


class API {
    let base_url = "http://localhost:3000"
//    let base_url = "https://www.gamerankr.com"
    
    func login(fbAuthToken: String, delegate: APIErrorDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "fb_auth_token", value: fbAuthToken)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                delegate.handleApi(error: "error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    delegate.handleApi(error: "server error, response: \(String(describing: response))")
                    return
            }
            NSLog("login was successful. Data: \(String(describing: data))")
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
            if let error = error {
                delegate.handleApi(error: "error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                delegate.handleApi(error: "server error, response: \(String(describing: response))")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                
                var results: [Game] = []
                
                let raw_results = json["results"] as! [[String:Any]]
                for raw_result in raw_results {
                    results.append(Game(id: raw_result["id"] as! String, title: raw_result["title"] as! String))
                }
                delegate.handleAPISearch(results: results)
            } catch {
                delegate.handleApi(error: "error parsing json: \(error)")
            }
        }
        task.resume()
    }
}

