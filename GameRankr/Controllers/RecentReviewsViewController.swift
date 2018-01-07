import UIKit

class RecentReviewsViewController: UIViewController, FullRankingDataSource, APIRecentReviewsDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var rankings = [RankingFull]()
    var nextPage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            api.recentReviews(after: nextPage, delegate: self)
            self.nextPage = nil
            DispatchQueue.main.async(execute: {
                self.loadingImage.isHidden = false
            })
        }
        let ranking = rankings[indexPath.row]
        return cellFor(ranking: ranking, tableView: tableView, indexPath: indexPath);
    }
    
    func handleAPI(rankings: [RankingFull], nextPage: String?) {
        self.rankings.append(contentsOf: rankings)
        self.nextPage = nextPage
        DispatchQueue.main.async(execute: {
            self.loadingImage?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from updatesView")
            return
        }
        switch segue.identifier! {
        case "rankingDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            let controller = segue.destination as! RankingViewController
            let ranking = rankings[indexPath.row]
            controller.ranking = ranking.fragments.rankingBasic
            controller.user = ranking.user.fragments.userBasic
            controller.game = ranking.game.fragments.gameBasic
        default:
            NSLog("updates view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
}
