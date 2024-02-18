import Foundation
import Apollo

protocol APILoginDelegate: APIErrorDelegate {
    func handleAPILogin()
    func handleAPILoginUnverified()
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
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
    
    func login(email: String, password: String, noVerifyEmail : Bool = false, delegate: APILoginDelegate) {
        self.email = email
        self.password = password
        var urlComponents = URLComponents(string: "\(base_url)/login.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "password", value: password)
        ]
        if noVerifyEmail {
            urlComponents.queryItems?.append(URLQueryItem(name: "no_verify_email", value: "true"))
        }
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: String]
                if json["unverified"] == "yes" {
                    NSLog("unverified")
                    delegate.handleAPILoginUnverified()
                    return
                }
                self.handleLogin(currentUserId: json["current_user_id"]!, token: json["token"]!)
                delegate.handleAPILogin()
            }
            catch {
                delegate.handleAPI(error: "parse error on login")
                return
            }
            
        }
        task.resume()
    }
    
    func createAccount(email: String, password: String, name: String, delegate: APIGenericSuccessDelegate) {
        self.email = email
        self.password = password
        var urlComponents = URLComponents(string: "\(base_url)/create_account.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "password", value: password),
            URLQueryItem(name: "real_name", value: name)
        ]
            
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            NSLog("Account created successfully")
            delegate.handleAPISuccess()
        }
        task.resume()
    }
    
    
    
    func retryLogin(delegate: APILoginDelegate) {
        login(email: email, password: password, noVerifyEmail: true, delegate: delegate)
    }
    
    func resendVerification(delegate: APIGenericSuccessDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/resend_verification_email.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "email", value: email),
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            delegate.handleAPISuccess();
            
        }
        task.resume()
    }
    
    func resetPasswordRequest(email: String, delegate: APIGenericSuccessDelegate) {
        var urlComponents = URLComponents(string: "\(base_url)/reset_password_request.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "email", value: email),
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if !(self.handleAPIErrorsBasic(data: data, response: response, error: error, apiErrorDelegate: delegate)) {
                return
            }
            delegate.handleAPISuccess();
            
        }
        task.resume()
    }
    
    func logout() {
        URLSession.shared.reset(completionHandler: {NSLog("URLSession has been cleared")})
        handleLogout()
    }
    
    internal func handleLogin(currentUserId: Api.ID, token: String) {
        NSLog("login as \(currentUserId) successful.")
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
        api.token = nil
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
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            var s = ""
            if data != nil {
                s = String(decoding: data!, as: UTF8.self)
            }
            NSLog("handleAPIErrorsBasic - server error, response: \(s)")
            apiErrorDelegate.handleAPI(error: "server error, response: \(s)")
            return false
        }
        return true
    }
}
