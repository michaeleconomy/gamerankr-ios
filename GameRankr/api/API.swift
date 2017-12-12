//
//  API.swift
//  GameRankr
//
//  Created by Michael on 12/11/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
let api = API()

protocol APISearchResultsDelegate {
    func handleApiSearch(error: String)
    func handleAPISearch(results: [Game])
}


class API {
    let base_url = "http://localhost:3000"
    
    func search(query: String, delegate: APISearchResultsDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/search.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                delegate.handleApiSearch(error: "error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                delegate.handleApiSearch(error: "server error, response: \(String(describing: response))")
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
                delegate.handleApiSearch(error: "error parsing json: \(error)")
            }
        }
        task.resume()
    }
}

