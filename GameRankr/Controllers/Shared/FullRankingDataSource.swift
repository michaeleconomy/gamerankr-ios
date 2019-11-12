import UIKit

protocol FullRankingDataSource: UITableViewDataSource {
}

extension FullRankingDataSource where Self : UIViewController {
    
    func cellFor(ranking: RankingFull, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        
        let port = ranking.fragments.rankingWithGame.fragments.rankingBasic.port
        let user = ranking.user
        let game = ranking.fragments.rankingWithGame.game
        
        cell.primaryLabel.text = "\(user.fragments.userBasic.realName) \(ranking.fragments.rankingWithGame.fragments.rankingBasic.verb)"
        var secondLabelText = "\(game.fragments.gameBasic.title) (\(port.platform.name))"
        let hasReview = ranking.fragments.rankingWithGame.fragments.rankingBasic.review != nil && ranking.fragments.rankingWithGame.fragments.rankingBasic.review! != ""
        if (hasReview || ranking.fragments.rankingWithGame.fragments.rankingBasic.ranking != nil) {
            secondLabelText += "\n"
            if (ranking.fragments.rankingWithGame.fragments.rankingBasic.ranking != nil) {
                let starsStr = String(repeating: "\u{2605}", count: ranking.fragments.rankingWithGame.fragments.rankingBasic.ranking!)
                secondLabelText += "\(starsStr) "
            }
            if (hasReview) {
                secondLabelText += "\"\(ranking.fragments.rankingWithGame.fragments.rankingBasic.review!)\""
            }
        }
        cell.secondaryLabel.text = secondLabelText
        
        if (port.smallImageUrl != nil) {
            cell.fixedSizeImageView.kf.indicatorType = .activity
            cell.fixedSizeImageView.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.fixedSizeImageView.image = PlaceholderImages.game
        }
        return cell
    }
}
