import Foundation
import Apollo
protocol APIMyGamesManagerDelegate : AuthenticatedAPIErrorDelegate, AnyObject {
    func handleUpdates()
}

class MyGamesManager : APIMyGamesDelegate, APIRankDelegate, APIDestroyRankingDelegate {
    static let sharedInstance = MyGamesManager()
    
    var rankings : [Api.RankingWithGame]
    var rankingsLoading : [Api.RankingWithGame]?
    var rankingsByGameId = [Api.ID:Api.RankingWithGame]()
    var rankingsWasUnpopulated = false
    
    var delegates = [APIMyGamesManagerDelegate]()
    var loadingCount = 0
    
    init() {
        do {
            rankings = try LocalSQLiteManager.sharedInstance.getRankings()
            for ranking in rankings {
                guard let game = ranking.game else {
                    continue
                }
                rankingsByGameId[game.fragments.gameBasic.id] = ranking
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
        rankingsLoading = [Api.RankingWithGame]()
        api.myGames(delegate: self)
    }
    
    func clear() {
        rankings = [Api.RankingWithGame]()
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
        if let index = self.delegates.firstIndex(where: {$0 === delegate}) {
            self.delegates.remove(at: index)
        }
    }
    
    subscript(index : Int) -> Api.RankingWithGame? {
        return rankings[index]
    }
    
    func count() -> Int {
        return rankings.count
    }
    
    func getRanking(gameId : Api.ID) -> Api.RankingWithGame? {
        return rankingsByGameId[gameId]
    }
    
    func rankPort(portId: Api.ID, ranking: Int? = nil, removeRanking: Bool = false, review: String? = nil, addShelfId: Api.ID? = nil, removeShelfId: Api.ID? = nil) {
        loadingCount += 1
        var removeRankingN = GraphQLNullable<Bool>.none
        if removeRanking {
            removeRankingN = .some(true)
        }
        var rankingN = GraphQLNullable<Int>.none
        if let ranking {
            rankingN = .some(ranking)
        }
        var reviewN = GraphQLNullable<String>.none
        if let review {
            reviewN = .some(review)
        }
        var addShelfIdN = GraphQLNullable<Api.ID>.none
        if let addShelfId {
            addShelfIdN = .some(addShelfId)
        }
        var removeShelfIdN = GraphQLNullable<Api.ID>.none
        if let removeShelfId {
            removeShelfIdN = .some(removeShelfId)
        }
        api.rankPort(portId: portId, ranking: rankingN, removeRanking: removeRankingN, review: reviewN, addShelfId: addShelfIdN, removeShelfId: removeShelfIdN, delegate: self)
    }
    
    func destroyRanking(portId: Api.ID) {
        loadingCount += 1
        api.destroyRanking(portId: portId, delegate: self)
    }
    
    func handleAPIMyGames(rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>) {
        if (!rankings.isEmpty) {
            rankingsLoading!.append(contentsOf: rankings)
            if (rankingsWasUnpopulated) {
                self.rankings.append(contentsOf: rankings)
                for ranking in rankings {
                    guard let game = ranking.game else {
                        continue
                    }
                    rankingsByGameId[game.fragments.gameBasic.id] = ranking
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
            var rankingsByGameIdLoading = [Api.ID: Api.RankingWithGame]()
            for ranking in rankingsLoading! {
                guard let game = ranking.game else {
                    continue
                }
                rankingsByGameIdLoading[game.fragments.gameBasic.id] = ranking
            }
            self.rankings = rankingsLoading!
            self.rankingsByGameId = rankingsByGameIdLoading
        }
        
        rankingsWasUnpopulated = false
        
        self.rankingsLoading = nil
//        LocalSQLiteManager.sharedInstance.persist(rankings: rankings)
        notifyDelegates()
    }
    
    private func addRanking(_ ranking: Api.RankingWithGame) {
        guard let game = ranking.game else {
            return
        }
        let gameId = game.fragments.gameBasic.id
        rankingsByGameId[gameId] = ranking
        rankings.insert(ranking, at: 0)
        if (rankingsLoading != nil) {
            rankingsLoading!.insert(ranking, at: 0)
        }
    }
    
    func handleAPI(ranking: Api.RankingWithGame) {
        guard let game = ranking.game else {
            return
        }
        deleteRankingFor(gameId: game.fragments.gameBasic.id)
        addRanking(ranking)
        LocalSQLiteManager.sharedInstance.delete(rankingId: ranking.fragments.rankingBasic.id)
//        LocalSQLiteManager.sharedInstance.persist(ranking: ranking)
        loadingCount -= 1
        notifyDelegates()
    }
    
    private func deleteRankingFor(gameId: Api.ID) {
        if let oldRanking = rankingsByGameId.removeValue(forKey: gameId) {
            if let oldIndex = rankings.firstIndex(where: {$0.fragments.rankingBasic.id == oldRanking.fragments.rankingBasic.id}) {
                rankings.remove(at: oldIndex)
            }
        }
        
        if (rankingsLoading != nil) {
            if let oldIndex = rankingsLoading!.firstIndex(where: {$0.game?.fragments.gameBasic.id == gameId}) {
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
    
    func handleAPIRankingDestruction(ranking: Api.DestroyRankingMutation.Data.Ranking) {
        loadingCount -= 1
        
        guard let game = ranking.game else {
            return
        }
        let gameId = game.id
        deleteRankingFor(gameId: gameId)
        LocalSQLiteManager.sharedInstance.delete(rankingId: ranking.id)
        notifyDelegates()
    }
}
