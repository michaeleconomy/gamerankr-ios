import Foundation
import Apollo

protocol APIMyGamesManagerDelegate : AuthenticatedAPIErrorDelegate, AnyObject {
    func handleUpdates()
}

class MyGamesManager : APIMyGamesDelegate, APIRankDelegate, APIDestroyRankingDelegate {
    static let sharedInstance = MyGamesManager()
    
    var rankings : [RankingWithGame]
    var rankingsLoading : [RankingWithGame]?
    var rankingsByGameId = [GraphQLID:RankingWithGame]()
    var rankingsWasUnpopulated = false
    
    var delegates = [APIMyGamesManagerDelegate]()
    var loadingCount = 0
    
    init() {
        do {
            rankings = try LocalSQLiteManager.sharedInstance.getRankings()
            for ranking in rankings {
                rankingsByGameId[ranking.game.fragments.gameBasic.id] = ranking
            }
        }
        catch {
            NSLog("error getting rankings from sql lite")
            rankings = []
        }
        
        if (rankings.isEmpty) {
            rankingsWasUnpopulated = true
        }
        if (api.signedIn) {
            load()
        }
    }
    
    func load() {
        if (loading()) {
            NSLog("MyGamesManager was already loading")
            return
        }
        if (api.signedOut) {
            NSLog("MyGamesManager - cannot load, not signed in yet")
            return
        }
        self.loadingCount += 1
        rankingsLoading = [RankingWithGame]()
        api.myGames(delegate: self)
    }
    
    func clear() {
        rankings = [RankingWithGame]()
        LocalSQLiteManager.sharedInstance.clearRankings()
        notifyDelegates()
        rankingsWasUnpopulated = true
    }
    
    func loading() -> Bool {
        return loadingCount > 0
    }
    
    func register(delegate: APIMyGamesManagerDelegate) {
        self.delegates.append(delegate)
    }
    
    func unregister(delegate: APIMyGamesManagerDelegate) {
        if let index = self.delegates.index(where: {$0 === delegate}) {
            self.delegates.remove(at: index)
        }
    }
    
    subscript(index : Int) -> RankingWithGame? {
        return rankings[index]
    }
    
    func count() -> Int {
        return rankings.count
    }
    
    func getRanking(gameId : GraphQLID) -> RankingWithGame? {
        return rankingsByGameId[gameId]
    }
    
    func rankPort(portId: GraphQLID, ranking: Int? = nil, removeRanking: Bool = false, review: String? = nil, addShelfId: GraphQLID? = nil, removeShelfId: GraphQLID? = nil) {
        loadingCount += 1
        api.rankPort(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId, delegate: self)
    }
    
    func destroyRanking(portId: GraphQLID) {
        loadingCount += 1
        api.destroyRanking(portId: portId, delegate: self)
    }
    
    func handleAPIMyGames(rankings: [RankingWithGame], nextPage: String?) {
        if (!rankings.isEmpty) {
            rankingsLoading!.append(contentsOf: rankings)
            if (rankingsWasUnpopulated) {
                self.rankings.append(contentsOf: rankings)
                for ranking in rankings {
                    rankingsByGameId[ranking.game.fragments.gameBasic.id] = ranking
                }
                notifyDelegates()
            }
            if (nextPage != nil){
                api.myGames(after: nextPage, delegate: self)
            }
        }
        if (nextPage == nil) {
            doneLoading()
        }
    }
    
    private func doneLoading() {
        loadingCount -= 1
        if (!rankingsWasUnpopulated) {
            var rankingsByGameIdLoading = [GraphQLID: RankingWithGame]()
            for ranking in rankingsLoading! {
                rankingsByGameIdLoading[ranking.game.fragments.gameBasic.id] = ranking
            }
            self.rankings = rankingsLoading!
            self.rankingsByGameId = rankingsByGameIdLoading
        }
        
        rankingsWasUnpopulated = false
        
        self.rankingsLoading = nil
        LocalSQLiteManager.sharedInstance.persist(rankings: rankings)
        notifyDelegates()
    }
    
    private func addRanking(_ ranking: RankingWithGame) {
        let gameId = ranking.game.fragments.gameBasic.id
        rankingsByGameId[gameId] = ranking
        rankings.insert(ranking, at: 0)
        if (rankingsLoading != nil) {
            rankingsLoading!.insert(ranking, at: 0)
        }
    }
    
    func handleAPI(ranking: RankingWithGame) {
        deleteRankingFor(gameId: ranking.game.fragments.gameBasic.id)
        addRanking(ranking)
        LocalSQLiteManager.sharedInstance.delete(rankingId: ranking.fragments.rankingBasic.id)
        LocalSQLiteManager.sharedInstance.persist(ranking: ranking)
        loadingCount -= 1
        notifyDelegates()
    }
    
    private func deleteRankingFor(gameId: GraphQLID) {
        if let oldRanking = rankingsByGameId.removeValue(forKey: gameId) {
            if let oldIndex = rankings.index(where: {$0.fragments.rankingBasic.id == oldRanking.fragments.rankingBasic.id}) {
                rankings.remove(at: oldIndex)
            }
        }
        
        if (rankingsLoading != nil) {
            if let oldIndex = rankingsLoading!.index(where: {$0.game.fragments.gameBasic.id == gameId}) {
                rankingsLoading!.remove(at: oldIndex)
            }
        }
    }
    
    func notifyDelegates() {
        delegates.forEach{$0.handleUpdates()}
    }
    
    func handleAPIAuthenticationError() {
        for delegate in delegates {
            delegate.handleAPIAuthenticationError()
        }
    }
    
    func handleAPI(error: String) {
        loadingCount -= 1 //yuck!
        //??? - if multiple delegates all try and pop alerts - is that a problem?
        delegates.forEach{$0.handleAPI(error: error)}
    }
    
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking) {
        loadingCount -= 1
        let gameId = ranking.game.id
        deleteRankingFor(gameId: gameId)
        LocalSQLiteManager.sharedInstance.delete(rankingId: ranking.id)
        notifyDelegates()
    }
}
