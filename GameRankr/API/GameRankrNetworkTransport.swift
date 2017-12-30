import Foundation
import Apollo

public struct GraphQLHTTPResponseError: Error, LocalizedError {
    public enum ErrorKind {
        case errorResponse
        case invalidResponse
        
        var description: String {
            switch self {
            case .errorResponse:
                return "Received error response"
            case .invalidResponse:
                return "Received invalid response"
            }
        }
    }
    
    /// The body of the response.
    public let body: Data?
    /// Information about the response as provided by the server.
    public let response: HTTPURLResponse
    public let kind: ErrorKind
    
    public var bodyDescription: String {
        if let body = body {
            if let description = String(data: body, encoding: .utf8) {
                return description
            } else {
                return "Unreadable response body"
            }
        } else {
            return "Empty response body"
        }
    }
    
    public var errorDescription: String? {
        return "\(kind.description) (\(response.statusCode)): \(bodyDescription)"
    }
}

public struct GameRankrAuthenticationError : Error {
    
}

class GameRankrNetworkTransport: NetworkTransport {
    
    public func send<Operation>(operation: Operation, completionHandler: @escaping (GraphQLResponse<Operation>?, Error?) -> Void) -> Cancellable {
        
        var request = URLRequest(url: URL(string: "\(api.base_url)/graphql")!)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = requestBody(for: operation)
        request.httpBody = try! JSONSerializationFormat.self.serialize(value: body)
        if let token = api.token {
            request.setValue(token, forHTTPHeaderField: "api-token")
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error != nil) {
                if let nsError = error as NSError? {
                    if (nsError.code == NSURLErrorCancelled) {
                        //api call cancelled - ignoring
                        return
                    }
                }
                completionHandler(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Response should be an HTTPURLResponse")
            }
            
            if (httpResponse.statusCode == 401) {
                completionHandler(nil, GameRankrAuthenticationError())
                return
            }
            
            if (httpResponse.statusCode != 200) {
                completionHandler(nil, GraphQLHTTPResponseError(body: data, response: httpResponse, kind: .errorResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(nil, GraphQLHTTPResponseError(body: nil, response: httpResponse, kind: .invalidResponse))
                return
            }
            
            do {
                guard let body =  try JSONSerializationFormat.self.deserialize(data: data) as? JSONObject else {
                    throw GraphQLHTTPResponseError(body: data, response: httpResponse, kind: .invalidResponse)
                }
                let response = GraphQLResponse(operation: operation, body: body)
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
        
        task.resume()
        
        return task
    }
    
    
    private func requestBody<Operation: GraphQLOperation>(for operation: Operation) -> GraphQLMap {
        return ["query": type(of: operation).requestString, "variables": operation.variables]
    }

}
