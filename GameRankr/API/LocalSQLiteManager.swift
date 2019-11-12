import Foundation
import SQLite
import Apollo

class LocalSQLiteManager {
    static let sharedInstance = LocalSQLiteManager()
    
    private let db : Connection
    
    private let rankingsTable = Table("rankings2")
    private let rankingId = Expression<String>("id")
    private let serializedRanking = Expression<String>("serializedRanking")
    
    private let miscTable = Table("misc")
    private let miscKey = Expression<String>("key")
    private let miscValue = Expression<String>("value")
    
    init() {
        let basePath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        db = try! Connection("\(basePath)/gamerankr.sqlite3")
        
        _ = Table("rankings").drop(ifExists: true)
        
        let createRankingTableQuery = rankingsTable.create(ifNotExists: true) { table in
            table.column(rankingId, unique: true)
            table.column(serializedRanking)
        }
        try! db.run(createRankingTableQuery)
        
        let createMiscTableQuery = miscTable.create(ifNotExists: true) { table in
            table.column(miscKey, unique: true)
            table.column(miscValue)
        }
        try! db.run(createMiscTableQuery)
    }
    
    func persist(rankings: [RankingWithGame]) {
        do {
            try db.run(rankingsTable.delete())  // Delete all the existing records
        }
        catch {
            NSLog("error persisting rankings")
        }
        for ranking in rankings {
            persist(ranking: ranking)
        }
    }
    
    func persist(ranking: RankingWithGame) {
        do {
            let rankingSerialized = try JSONSerialization.data(withJSONObject: ranking.jsonObject, options: [])
            let rankingString = String(data: rankingSerialized, encoding: .utf8)!
            let insert = rankingsTable.insert(rankingId <- ranking.fragments.rankingBasic.id, serializedRanking <- rankingString)
            try db.run(insert)
        }
        catch let error {
            NSLog("Error while persisting row: \(ranking), error: \(error)")
        }
    }
    
    func delete(rankingId: GraphQLID) {
        do {
            try db.run(rankingsTable.where(self.rankingId == rankingId).delete())
        }
        catch let error {
            NSLog("error deleting ranking \(rankingId): \(error)")
        }
    }
    
    func clearRankings() {
        do {
            try db.run(rankingsTable.delete())  // Delete all the existing records
        }
        catch {
            NSLog("error persisting rankings")
        }
    }
    
    func getRankings() throws -> [RankingWithGame] {
        var rankings = [RankingWithGame]()
        let rows = try db.prepare(rankingsTable)
        
        for row in rows {
            let rankingData = row[serializedRanking].data(using: .utf8)!
            let rankingJson = try JSONSerialization.jsonObject(with: rankingData, options: []) as! JSONObject
            let ranking = try RankingWithGame(jsonObject: rankingJson)
            rankings.append(ranking)
        }
        return rankings
    }
    
    func putMisc(key: String, value: String) {
        do {
            try db.run(miscTable.insert(miscKey <- key, miscValue <- value))
        }
        catch {
            NSLog("error persisting token")
        }
    }
    
    func clearMisc() {
        do {
            try db.run(miscTable.delete())  // Delete all the existing records
        }
        catch {
            NSLog("error persisting rankings")
        }
    }
    
    func getMisc(key: String) -> String? {
        do {
            let rows = try db.prepare(miscTable.filter(miscKey == key).select(miscValue))
            for row in rows {
                return row[miscValue]
            }
            return nil
        }
        catch {
            NSLog("error getting token")
            return nil
        }
    }
}
