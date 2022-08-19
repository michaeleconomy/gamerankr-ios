import Foundation

class RankingFilter {
    
    var shelves = Set<String>()
    
    private var _text = ""
    var text: String? {
        get {
            return _text
        }
        set (text) {
            _text = (text ?? "").lowercased()
        }
    }
    
    func apply(rankings: [RankingWithGame]) -> [RankingWithGame] {
        return rankings.filter({ ranking in
            if (!filterShelves(ranking)) {
                return false
            }
            if (!filterText(ranking)) {
                return false
            }
            return true
        })
    }
    
    private func filterShelves(_ ranking: RankingWithGame) -> Bool {
        if (!shelves.isEmpty) {
            let onShelf = ranking.fragments.rankingBasic.shelves.contains(where: { shelf in
                return shelves.contains(shelf.fragments.shelfBasic.name)
            })
            if (!onShelf) {
                return false
            }
        }
        return true
    }
    
    private func filterText(_ ranking: RankingWithGame) -> Bool {
        let text = text ?? ""
        if (text == "") {
            return true
        }
        
        if let game = ranking.game {
            let title = game.fragments.gameBasic.title
            if title.lowercased().contains(text) {
                return true
            }
            return true
        }
        
        let rankingBasic = ranking.fragments.rankingBasic
        let port = rankingBasic.port
        
        if let port = port {
            let platform = port.platform
            if platform.name.lowercased().contains(text) {
                return true
            }
            if platform.shortName.lowercased().contains(text) {
                return true
            }
        }
        return false
    }
    
    func copy() -> RankingFilter {
        let copy = RankingFilter()
        copy.shelves = Set(shelves)
        copy._text = _text
        return copy
    }
}
