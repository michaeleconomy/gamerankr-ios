import Foundation
import Apollo

protocol APILoginDelegate: APIErrorDelegate {
    func handleAPILogin()
}

protocol APIAuthenticationDelegate {
    func handleAPILogin()
    func handleAPILogout()
}


extension GameRankrAPI {

    func register(authenticationDelegate: APIAuthenticationDelegate) {
        authDelegates.append(authenticationDelegate)
    }
    
    func login(fbAuthToken: String, delegate: APILoginDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "fb_auth_token", value: fbAuthToken)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: String]
                self.handleLogin(currentUserId: json["current_user_id"]!,token: json["token"]!)
            }
            catch {
                delegate.handleAPI(error: "parse error on login")
                return
            }
            
            delegate.handleAPILogin()
        }
        task.resume()
    }
    
    func logout() {
        URLSession.shared.reset(completionHandler: {NSLog("URLSession has been cleared")})
        handleLogout()
    }
    
    internal func handleLogin(currentUserId: GraphQLID, token: String) {
        NSLog("login was successful.")
        self.signedIn = true
        self.token = token
        self.currentUserId = currentUserId
        LocalSQLiteManager.sharedInstance.putMisc(key: "token", value: token)
        LocalSQLiteManager.sharedInstance.putMisc(key: "currentUserId", value: currentUserId)
        
        MyGamesManager.sharedInstance.load()
        for authDelegate in authDelegates {
            authDelegate.handleAPILogin()
        }
    }
    
    internal func handleLogout() {
        self.signedIn = false
        MyGamesManager.sharedInstance.clear()
        LocalSQLiteManager.sharedInstance.clearMisc()
        for authDelegate in authDelegates {
            authDelegate.handleAPILogout()
        }
    }
    
    private func handleAPIErrorsBasic(data: Data?, response: URLResponse?, error: Error?, apiErrorDelegate: APIErrorDelegate) -> Bool {
        if let error = error {
            NSLog("handleAPIErrorsBasic - error: \(error)")
            apiErrorDelegate.handleAPI(error: "error: \(error)")
            return false
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                NSLog("handleAPIErrorsBasic - server error, response: \(String(describing: response))")
                apiErrorDelegate.handleAPI(error: "server error, response: \(String(describing: response))")
                return false
        }
        return true
    }
}
