import UIKit

protocol FullRankingDataSource: UITableViewDataSource {
}

extension FullRankingDataSource where Self : UIViewController {
    
    func cellFor(ranking: RankingFull, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        
        let port = ranking.port
        let user = ranking.user
        let game = ranking.game
        
        cell.primaryLabel.text = "\(user.realName) \(ranking.verb)"
        var secondLabelText = "\(game.title) (\(port.platform.name))"
        let hasReview = ranking.review != nil && ranking.review! != ""
        if (hasReview || ranking.ranking != nil) {
            secondLabelText += "\n"
            if (ranking.ranking != nil) {
                let starsStr = String(repeating: "\u{2605}", count: ranking.ranking!)
                secondLabelText += "\(starsStr) "
            }
            if (hasReview) {
                secondLabelText += "\"\(ranking.review!)\""
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
