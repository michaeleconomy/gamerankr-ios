import UIKit


class FullRankingDataSource : UIViewController, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        
        let data = rankings[indexPath.row]
        populateCell(cell: cell, with: data)
        return cell
    }
    
    func populateCell(cell: FixedImageSizeTableCell, with rankingFull: RankingFull) {
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
        secondaryText.add(cell.rankingText(rankingBasic: rankingBasic))
        cell.secondaryLabel?.attributedText = secondaryText.string
        
        cell.setImage(port: port)
    }
    
    @IBOutlet weak var table: UITableView!
    internal var rankings = [RankingFull]()
}
