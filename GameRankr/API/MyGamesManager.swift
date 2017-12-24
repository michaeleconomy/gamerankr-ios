import Foundation
import Apollo

protocol APIMyGamesManagerDelegate : APIErrorDelegate {
    func handleUpdates()
}

class MyGamesManager : APIMyGamesDelegate, APIRankDelegate, APIDestroyRankingDelegate {
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
    
    func rankPort(portId: GraphQLID, ranking: Int? = nil, removeRanking: Bool = false, review: String? = nil, addShelfId: GraphQLID? = nil, removeShelfId: GraphQLID? = nil) {
        api.rankPort(portId: portId, ranking: ranking, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId, delegate: self)
    }
    
    func destroyRanking(portId: GraphQLID) {
        api.destroyRanking(portId: portId, delegate: self)
    }
    
    func handleAPIMyGames(response: MyGamesQuery.Data.MyGame) {
        let additionalRankings = response.edges?.map({$0?.ranking?.fragments.rankingBasic}) as! [RankingBasic]
        if (!additionalRankings.isEmpty) {
            additionalRankings.forEach{ addRanking($0) }
            if (response.pageInfo.hasNextPage){
                api.myGames(after: response.pageInfo.endCursor, delegate: self)
            }
            notifyDelegates()
        }
        if (!response.pageInfo.hasNextPage) {
            loading = false
            loaded = true
        }
    }
    
    private func addRanking(_ ranking: RankingBasic) {
        let gameId = ranking.game.id
        
        rankingsByGameId[gameId] = ranking
        rankings.insert(ranking, at: 0)
    }
    
    func handleAPI(ranking: RankingBasic) {
        addRanking(ranking)
        notifyDelegates()
    }
    
    private func deleteRankingFor(gameId: GraphQLID) {
        if let oldRanking = getRanking(gameId: gameId) {
            if let oldIndex = rankings.index(where: {$0.id == oldRanking.id}) {
                rankings.remove(at: oldIndex)
            }
        }
    }
    
    func notifyDelegates() {
        delegates.forEach{$0.handleUpdates()}
    }
    
    func handleApi(error: String) {
        //??? - if multiple delegates all try and pop alerts - is that a problem?
        delegates.forEach{$0.handleApi(error: error)}
    }
    
    func handleAPIRankingDestruction(ranking: DestroyRankingMutation.Data.Ranking) {
        let gameId = ranking.game.id
        deleteRankingFor(gameId: gameId)
        notifyDelegates()
    }
    
}
