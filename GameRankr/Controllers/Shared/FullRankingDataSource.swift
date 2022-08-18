import UIKit

protocol FullRankingDataSource: UITableViewDataSource {
}

extension FullRankingDataSource where Self : UIViewController {
    
    func cellFor(ranking: RankingFull, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        
        let port = ranking.fragments.rankingWithGame.fragments.rankingBasic.port
        let user = ranking.user
        let game = ranking.fragments.rankingWithGame.game
        
        cell.primaryLabel.text = "\(user?.fragments.userBasic.realName ?? "Unknown") \(ranking.fragments.rankingWithGame.fragments.rankingBasic.verb)"
        var secondLabelText = "\(game?.fragments.gameBasic.title ?? "Unknown") (\(port?.platform.name ?? "UKN"))"
        let review = ranking.fragments.rankingWithGame.fragments.rankingBasic.review
        let hasReview = review != nil && review != ""
        let stars = ranking.fragments.rankingWithGame.fragments.rankingBasic.ranking
        if (hasReview || stars != nil) {
            secondLabelText += "\n"
            if (stars != nil) {
                let starsStr = String(repeating: "\u{2605}", count: stars!)
                secondLabelText += "\(starsStr) "
            }
            if (hasReview) {
                secondLabelText += "\"\(review!)\""
            }
        }
        cell.secondaryLabel.text = secondLabelText
        
        if (port?.smallImageUrl != nil) {
            cell.fixedSizeImageView.kf.indicatorType = .activity
            cell.fixedSizeImageView.kf.setImage(with: URL(string: port!.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.fixedSizeImageView.image = PlaceholderImages.game
        }
        return cell
    }
}
