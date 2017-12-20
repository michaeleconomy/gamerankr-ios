import Foundation
import Apollo

protocol APIMyGamesManagerDelegate : APIErrorDelegate {
    func handleUpdates()
}

class MyGamesManager : APIMyGamesDelegate {
    static let sharedInstance = MyGamesManager()
    
    var rankings : [RankingBasic] = []
    var rankingsByGameId = [GraphQLID:RankingBasic]()
    
    var delegates = [APIMyGamesManagerDelegate]()
    var loading = false
    var loaded = false
    
    func load() {
        if (loading) {
            NSLog("MyGamesManager was already loading")
            return
        }
        if (loaded) {
            NSLog("MyGamesManager is already loaded")
            return
        }
        if (!api.signed_in) {
            NSLog("MyGamesManager - cannot load, not signed in yet")
            return
        }
        self.loading = true
        api.myGames(delegate: self)
    }
    
    func registerDelegate(delegate: APIMyGamesManagerDelegate) {
        self.delegates.append(delegate)
    }
    
    subscript(index : Int) -> RankingBasic? {
        return rankings[index]
    }
    
    func count() -> Int {
        return rankings.count
    }
    
    func getRanking(gameId : GraphQLID) -> RankingBasic? {
        return rankingsByGameId[gameId]
    }
    
    func handleAPIMyGames(response: MyGamesQuery.Data.MyGame) {
        let additionalRankings = response.edges?.map({$0?.ranking?.fragments.rankingBasic}) as! [RankingBasic]
        if (!additionalRankings.isEmpty) {
            additionalRankings.forEach{ rankingsByGameId[$0.game.id] = $0}
            self.rankings.append(contentsOf: additionalRankings)
            if (response.pageInfo.hasNextPage){
                api.myGames(after: response.pageInfo.endCursor, delegate: self)
            }
            delegates.forEach{$0.handleUpdates()}
        }
        if (!response.pageInfo.hasNextPage) {
            loading = false
            loaded = true
        }
    }
    
    func handleApi(error: String) {
        // - if multiple delegates all try and pop alerts - is that a problem?
        delegates.forEach{$0.handleApi(error: error)}
    }
}
