import Foundation
import SQLite
import Apollo

class LocalSQLiteManager {
    static let sharedInstance = LocalSQLiteManager()
    
    
    let rankingsTable = Table("rankings")
    let serializedRanking = Expression<String>("serializedRanking")
    let db : Connection
    
    init() {
        let basePath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        db = try! Connection("\(basePath)/gamerankr.sqlite3")
        
        let createTableQuery = rankingsTable.create(ifNotExists: true) { table in
            table.column(serializedRanking)
        }
        try! db.run(createTableQuery)
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
    
}
