import Foundation
import SQLite
import Apollo

class LocalSQLiteManager {
    static let sharedInstance = LocalSQLiteManager()
    
    private let db : Connection
    
    private let rankingsTable = Table("rankings")
    private let serializedRanking = Expression<String>("serializedRanking")
    private let miscTable = Table("misc")
    private let miscKey = Expression<String>("key")
    private let miscValue = Expression<String>("value")
    
    init() {
        let basePath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        db = try! Connection("\(basePath)/gamerankr.sqlite3")
        
        let createRankingTableQuery = rankingsTable.create(ifNotExists: true) { table in
            table.column(serializedRanking)
        }
        try! db.run(createRankingTableQuery)
        
        
        let createMiscTableQuery = miscTable.create(ifNotExists: true) { table in
            table.column(miscKey, unique: true)
            table.column(miscValue)
        }
        try! db.run(createMiscTableQuery)
    }
    
    func persistRankings(rankings: [RankingBasic]) {
        do {
            try db.run(rankingsTable.delete())  // Delete all the existing records
            for ranking in rankings {
                let rankingSerialized = try JSONSerialization.data(withJSONObject: ranking.jsonObject, options: [])
                let rankingString = String(data: rankingSerialized, encoding: .utf8)!
                let insert = rankingsTable.insert(serializedRanking <- rankingString)
                try db.run(insert)
            }
        }
        catch {
            NSLog("error persisting rankings")
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
    
    func getRankings() throws -> [RankingBasic] {
        var rankings = [RankingBasic]()
        let rows = try db.prepare(rankingsTable)
        
        for row in rows {
            let rankingData = row[serializedRanking].data(using: .utf8)!
            let rankingJson = try JSONSerialization.jsonObject(with: rankingData, options: []) as! JSONObject
            let ranking = try RankingBasic(jsonObject: rankingJson)
            rankings.append(ranking)
        }
        return rankings
    }
    
    func persistToken(token: String) {
        do {
            try db.run(miscTable.insert(miscKey <- "token", miscValue <- token))
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
    
    func getToken() -> String? {
        do {
            let rows = try db.prepare(miscTable.filter(miscKey == "token").select(miscValue))
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
