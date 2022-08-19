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
        let rankingBasic = ranking.fragments.rankingBasic
        let port = rankingBasic.port
        
        let verb = rankingBasic.verb
        let title = game?.fragments.gameBasic.title ?? "unknown"
        let platform = port?.platform.shortName ?? "UKN"
        
        let primaryText = AttributedStringBuilder()
        primaryText.add(verb + " " + title + " ")
        primaryText.add(platform, color: PredefinedColors.grey)
        
        label.attributedText = primaryText.string
        
        let secondLine = AttributedStringBuilder()
        
        let stars = rankingBasic.ranking ?? 0
        if stars > 0 {
            let starsStr = String(repeating: "\u{2605}", count: stars)
            secondLine.add(starsStr + " ")
        }
        let review = rankingBasic.review ?? ""
        if review != "" {
            secondLine.add("\"\(review)\"")
        }
        if stars > 0 || review != "" {
            secondLine.add("\n")
        }
        secondLine.add(Formatter.format(dateString: rankingBasic.updatedAt))
        if rankingBasic.commentsCount > 0 {
            secondLine.add("  \(rankingBasic.commentsCount) Comments")
        }
        
        subLabel.attributedText = secondLine.string
        
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
