import Foundation
import UIKit

class UserRankingRow : UIView {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    var ranking: RankingWithGame?
    
    func populate(ranking: RankingWithGame) {
        self.ranking = ranking
        let game = ranking.game
        let port = ranking.fragments.rankingBasic.port
        
        let verb = ranking.fragments.rankingBasic.verb
        let title = game?.fragments.gameBasic.title ?? "unknown"
        let platform = port?.platform.name ?? "UKN"
        label.text = "\(verb.capitalizingFirstLetter()) \(title) (\(platform))"
        
        var secondLine = ""
        
        if let stars = ranking.fragments.rankingBasic.ranking {
            let starsStr = String(repeating: "\u{2605}", count: stars)
            secondLine += "\(starsStr) "
        }
        let review = ranking.fragments.rankingBasic.review
        if review != nil && review != "" {
            secondLine += "\"\(review!)\""
        }
       subLabel.text = secondLine
        
        if let imageUrl = port?.smallImageUrl {
            image.kf.indicatorType = .activity
            image.kf.setImage(
                with: URL(string: imageUrl)!,
                placeholder: PlaceholderImages.game,
                completionHandler: { (result) in
                    self.layoutSubviews()
                }
            )
        }
        else {
            image.image = PlaceholderImages.game
        }
    }
}
