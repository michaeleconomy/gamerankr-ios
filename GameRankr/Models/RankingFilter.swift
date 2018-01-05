import Foundation

class RankingFilter {
    
    var shelves = Set<String>()
    
    func apply(rankings: [RankingWithGame]) -> [RankingWithGame] {
        return rankings.filter({ ranking in
            let onShelf = ranking.shelves.contains(where: { shelf in
                return shelves.contains(shelf.name)
            })
            if (!onShelf) {
                return false
            }
            return true
        })
    }
    
    func copy() -> RankingFilter {
        let copy = RankingFilter()
        copy.shelves = Set(shelves)
        return copy
    }
}
