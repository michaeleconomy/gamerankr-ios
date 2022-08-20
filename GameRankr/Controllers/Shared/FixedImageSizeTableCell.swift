import UIKit
class FixedImageSizeTableCell: UITableViewCell {
    
    @IBOutlet weak var fixedSizeImageView: UIImageView!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fixedSizeImageView.frame = CGRect(x: 10, y: (frame.height / 2) - 30, width: 60, height: 60)
    }
    
    func populateForShelf(with rankingWithGame: RankingWithGame) {
        let game = rankingWithGame.game
        let rankingBasic = rankingWithGame.fragments.rankingBasic
        let port = rankingBasic.port
        
        let primaryText = AttributedStringBuilder()
        primaryText.add(game?.fragments.gameBasic.title ?? "Unknown")
        primaryText.add(" ")
        primaryText.add(port?.platform.shortName ?? "UKN", color: PredefinedColors.grey, fontSize: 12)
        primaryLabel?.attributedText = primaryText.string
        
        let secondaryText = AttributedStringBuilder()
        let stars = rankingBasic.ranking ?? 0
        if stars > 0 {
            secondaryText.add(String(repeating: "\u{2605}", count: stars), color: PredefinedColors.starRed)
            let greyStars = 5 - stars
            if greyStars > 0 {
                secondaryText.add(String(repeating: "\u{2605}", count: greyStars), color: PredefinedColors.starGrey)
            }
            secondaryText.add(" ")
        }
        let review = rankingBasic.review ?? ""
        if review != "" {
            secondaryText.add(" [review]")
        }
        if stars > 0 || review != "" {
            secondaryText.add("\n")
        }
        secondaryText.add("Shelves: " + rankingBasic.shelves.map{$0.fragments.shelfBasic.name}.joined(separator: ", "))
        
        secondaryText.add("\n" + Formatter.format(dateString: rankingBasic.updatedAt))
        if (rankingBasic.commentsCount > 0) {
            secondaryText.add("\(rankingBasic.commentsCount) comment")
            if (rankingBasic.commentsCount > 1) {
                secondaryText.add("s")
            }
        }
        secondaryLabel?.attributedText = secondaryText.string
        
        setImage(port: rankingBasic.port)
    }
    
    func setImage(port: RankingBasic.Port?) {
        if let imageUrl = port?.smallImageUrl {
            fixedSizeImageView?.kf.indicatorType = .activity
            fixedSizeImageView?.kf.setImage(with: URL(string: imageUrl)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                self.layoutSubviews()
            })
        }
        else {
            fixedSizeImageView?.image = PlaceholderImages.game
        }
    }
    
    func rankingText(rankingBasic: RankingBasic) -> AttributedStringBuilder {
        let text = AttributedStringBuilder()
        
        let review = rankingBasic.review ?? ""
        let stars = rankingBasic.ranking ?? 0
        if (review != "" || stars > 0) {
            if stars > 0 {
                text.add(String(repeating: "\u{2605}", count: stars), color: PredefinedColors.starRed)
                let greyStars = 5 - stars
                if greyStars > 0 {
                    text.add(String(repeating: "\u{2605}", count: greyStars), color: PredefinedColors.starGrey)
                }
                text.add(" ")
            }
            if (review != "") {
                var shortenedReview = review
                if review.count > 100 {
                    shortenedReview = String(review.prefix(97)) + "..."
                }
                text.add("\"\(shortenedReview)\"")
            }
            text.add("\n")
        }
        text.add(Formatter.format(dateString: rankingBasic.updatedAt))
        if rankingBasic.commentsCount > 0 {
            text.add("   \(rankingBasic.commentsCount) Comments")
        }
        return text
    }
}
