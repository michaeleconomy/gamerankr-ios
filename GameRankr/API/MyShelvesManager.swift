import Foundation

protocol APIMyShelvesManagerDelegate : AuthenticatedAPIErrorDelegate, AnyObject {
    func handleShelvesUpdates()
}

class MyShelvesManager : APIShelvesDelegate {
    static let sharedInstance = MyShelvesManager()
    var shelves: [Api.MyShelvesQuery.Data.Shelf]?
    
    var delegates = [APIMyShelvesManagerDelegate]()
    var loading = false
    
    func load() {
        if (loading) {
            NSLog("MyShelvesManager was already loading")
            return
        }
        if (shelves != nil) {
            NSLog("MyShelvesManager is already loaded")
            return
        }
        if (api.signedOut) {
            NSLog("MyShelvesManager - cannot load, not signed in yet")
            return
        }
        self.loading = true
        api.myShelves(delegate: self)
    }
    
    
    subscript(index : Int) -> Api.MyShelvesQuery.Data.Shelf? {
        return shelves?[index]
    }
    
    func count() -> Int {
        if (shelves != nil){
            return shelves!.count
        }
        return 0
    }
    
    func handleAPI(shelves: [Api.MyShelvesQuery.Data.Shelf]) {
        self.shelves = shelves
        self.loading = false
        delegates.forEach{$0.handleShelvesUpdates()}
    }
    
    func register(delegate: APIMyShelvesManagerDelegate) {
        self.delegates.append(delegate)
    }
    
    func unregister(delegate: APIMyShelvesManagerDelegate) {
        if let index = self.delegates.firstIndex(where: {$0 === delegate}) {
            self.delegates.remove(at: index)
        }
    }
    
    func handleAPI(error: String) {
        // - if multiple delegates all try and pop alerts - is that a problem?
        delegates.forEach{$0.handleAPI(error: error)}
    }
    
    func handleAPIAuthenticationError() {
        
        delegates.forEach{$0.handleAPIAuthenticationError()}
    }
    
}
