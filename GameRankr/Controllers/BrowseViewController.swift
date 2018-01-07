import UIKit
class BrowseViewController: UIViewController, FullRankingDataSource, APIPopularGamesDelegate, APIRecentReviewsDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var popularGamesCollection: UICollectionView!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var reviewsTable: UITableView!
    @IBOutlet weak var moreReviewsButton: UIButton!
    
    private var games: [GameBasic]?
    private var rankings: [RankingFull]?
    private var nextPage: String?
    var fetchedUpdates = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
        api.popularGames(delegate: self)
        api.recentReviews(delegate: self)
        configureView()
    }
    
    func asyncConfigureView() {
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func configureView() {
        loadingImage?.isHidden = false
        if (games == nil) {
            scrollView?.isHidden = true
            popularGamesCollection.reloadData()
            return
        }
        scrollView?.isHidden = false
        if (rankings == nil) {
            reviewsLabel?.isHidden = true
            reviewsTable?.isHidden = true
            moreReviewsButton?.isHidden = true
            return
        }
        reviewsLabel?.isHidden = false
        reviewsTable?.isHidden = false
        moreReviewsButton?.isHidden = false
        loadingImage?.isHidden = true
        reviewsTable?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ranking = rankings![indexPath.row]
        return cellFor(ranking: ranking, tableView: tableView, indexPath: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from updatesView")
            return
        }
        switch segue.identifier! {
        case "rankingDetail":
            guard let indexPath = reviewsTable.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            let controller = segue.destination as! RankingViewController
            let ranking = rankings![indexPath.row]
            controller.ranking = ranking.fragments.rankingBasic
            controller.user = ranking.user.fragments.userBasic
            controller.game = ranking.game.fragments.gameBasic
        case "moreRecentReviews":
            let controller = segue.destination as! RecentReviewsViewController
            controller.rankings = rankings
            api.recentReviews(after: nextPage, delegate: controller)
        default:
            NSLog("updates view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    func handleAPI(games: [GameBasic]) {
        self.games = games
        
        asyncConfigureView()
    }
    
    func handleAPI(rankings: [RankingFull], nextPage: String?) {
        self.rankings = rankings
        NSLog("rankings.count: \(rankings.count)")
        self.nextPage = nextPage
        
        asyncConfigureView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCoverCollectionCell
        let game = games![indexPath.row]
        let port = game.ports.first!
        
        if (port.smallImageUrl != nil) {
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.imageView.image = PlaceholderImages.game
        }
        
        return cell
    }
}
