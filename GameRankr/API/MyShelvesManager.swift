import Foundation

protocol APIMyShelvesManagerDelegate : APIErrorDelegate {
    func handleUpdates()
}

class MyShelvesManager : APIShelvesDelegate {
    static let sharedInstance = MyShelvesManager()
    
    var shelves: [MyShelvesQuery.Data.Shelf]?
    
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
        if (!api.signed_in) {
            NSLog("MyShelvesManager - cannot load, not signed in yet")
            return
        }
        self.loading = true
        api.myShelves(delegate: self)
    }
    
    
    subscript(index : Int) -> MyShelvesQuery.Data.Shelf? {
        return shelves?[index]
    }
    
    func count() -> Int {
        if (shelves != nil){
            return shelves!.count
        }
        return 0
    }
    
    func handleAPI(shelves: [MyShelvesQuery.Data.Shelf]) {
        self.shelves = shelves
        self.loading = false
        delegates.forEach{$0.handleUpdates()}
    }
    
    func registerDelegate(delegate: APIMyShelvesManagerDelegate) {
        self.delegates.append(delegate)
    }
    
    func handleApi(error: String) {
        // - if multiple delegates all try and pop alerts - is that a problem?
        delegates.forEach{$0.handleApi(error: error)}
    }
    
}
