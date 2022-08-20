import UIKit

class RecentReviewsViewController: FullRankingDataSource, APIRecentReviewsDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    
    var nextPage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            api.recentReviews(after: nextPage, delegate: self)
            self.nextPage = nil
            DispatchQueue.main.async {
                self.loadingImage.isHidden = false
            }
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func handleAPI(rankings: [RankingFull], nextPage: String?) {
        self.rankings.append(contentsOf: rankings)
        self.nextPage = nextPage
        DispatchQueue.main.async {
            self.loadingImage?.isHidden = true
            self.table?.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier")
            return
        }
        switch identifier {
        case "rankingDetail":
            guard let indexPath = table.indexPathForSelectedRow else {
                unexpectedError("tableView.indexPathForSelectedRow was nil")
                return
            }
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            let ranking = rankings[indexPath.row]
            controller.ranking = ranking.fragments.rankingWithGame.fragments.rankingBasic
            controller.user = ranking.user?.fragments.userBasic
            controller.game = ranking.fragments.rankingWithGame.game?.fragments.gameBasic
        default:
            silentError("unhandled segue identifier: \(identifier)")
        }
    }
}
