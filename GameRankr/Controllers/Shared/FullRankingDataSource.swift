import UIKit

protocol FullRankingDataSource: UITableViewDataSource {
}

extension FullRankingDataSource where Self : UIViewController {
    
    func cellFor(rankingFull: RankingFull, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        let rankingWithGame = rankingFull.fragments.rankingWithGame
        let game = rankingWithGame.game
        let rankingBasic = rankingWithGame.fragments.rankingBasic
        let port = rankingBasic.port
        let user = rankingFull.user
        let userBasic = user?.fragments.userBasic
        let userName = userBasic?.realName ?? "Unknown"
        let gameTitle = game?.fragments.gameBasic.title ?? "Unknown"
        
        cell.primaryLabel?.text = "\(userName) \(rankingBasic.verb)"
        let secondaryText = AttributedStringBuilder()
        secondaryText.add("\(gameTitle) ")
        
        let platformShortName = port?.platform.shortName ?? "UKN"
        secondaryText.add(platformShortName, color: PredefinedColors.grey)
        secondaryText.add("\n")
        secondaryText.add(rankingText(rankingBasic: rankingBasic))
        cell.secondaryLabel?.attributedText = secondaryText.string
        
        setImage(port: port, cell: cell)
        return cell
    }
    
    
    func cellFor(rankingWithGame: RankingWithGame, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        let game = rankingWithGame.game
        let rankingBasic = rankingWithGame.fragments.rankingBasic
        let port = rankingBasic.port
        
        let primaryText = AttributedStringBuilder()
        
        let gameTitle = game?.fragments.gameBasic.title ?? "Unknown"
        let platformShortName = port?.platform.shortName ?? "UKN"
        primaryText.add("\(rankingBasic.verb.capitalized) \(gameTitle) ")
        primaryText.add(platformShortName, color: PredefinedColors.grey)
        
        cell.primaryLabel?.attributedText = primaryText.string
        let secondaryText = AttributedStringBuilder()
        secondaryText.add(rankingText(rankingBasic: rankingBasic))
        cell.secondaryLabel?.attributedText = secondaryText.string
        
        setImage(port: port, cell: cell)
        
        return cell
    }
    
    private func setImage(port: RankingBasic.Port?, cell: FixedImageSizeTableCell) {
        if let imageUrl = port?.smallImageUrl {
            cell.fixedSizeImageView.kf.indicatorType = .activity
            cell.fixedSizeImageView.kf.setImage(with: URL(string: imageUrl)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.fixedSizeImageView?.image = PlaceholderImages.game
        }
    }
    
    private func rankingText(rankingBasic: RankingBasic) -> String {
        var text = ""
        
        let review = rankingBasic.review ?? ""
        let stars = rankingBasic.ranking ?? 0
        if (review != "" || stars > 0) {
            if (stars > 0) {
                let starsStr = String(repeating: "\u{2605}", count: stars)
                text += "\(starsStr) "
            }
            if (review != "") {
                text += "\"\(review)\""
            }
            text += "\n"
        }
        text += Formatter.format(dateString: rankingBasic.updatedAt)
        if rankingBasic.commentsCount > 0 {
            text += "   \(rankingBasic.commentsCount) Comments"
        }
        return text
    }
    
    
}
