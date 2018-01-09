import UIKit
class BrowseViewController: UIViewController, FullRankingDataSource, APIPopularGamesDelegate, APIRecentReviewsDelegate {
    
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var gamesStack: UIStackView!
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
    
    func addGames() {
        for game in games! {
            let gameImage = UIButton()
            let port = game.ports.first!
            gameImage.addConstraint(gameImage.widthAnchor.constraint(equalToConstant: 60))
            gameImage.addConstraint(gameImage.heightAnchor.constraint(equalToConstant: 60))
            
            if (port.smallImageUrl != nil) {
                gameImage.kf.setImage(with: URL(string: port.smallImageUrl!)!, for: .normal, placeholder: PlaceholderImages.game)
            }
            else {
                gameImage.setImage(PlaceholderImages.game, for: .normal)
            }
            
            gameImage.addTarget(self, action: #selector(gameImageTouch(sender:)), for: .touchUpInside)
            
            gamesStack.addArrangedSubview(gameImage)
        }
    }
    
    @objc func gameImageTouch(sender: UIButton) {
         performSegue(withIdentifier: "gameDetail", sender: sender)
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
            
        case "gameDetail":
            let button = sender as! UIButton
            guard let index = gamesStack.arrangedSubviews.index(of: button) else {
                NSLog("could not find button in gamesStack")
                return
            }
            let controller = segue.destination as! GameViewController
            let game = games![index]
            controller.game = game
        case "moreRecentReviews":
            let controller = segue.destination as! RecentReviewsViewController
            api.recentReviews(after: nextPage, delegate: controller)
        default:
            NSLog("browse view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    func handleAPI(games: [GameBasic]) {
        self.games = games
        
        DispatchQueue.main.async(execute: {
            self.addGames()
            self.configureView()
        })
    }
    
    func handleAPI(rankings: [RankingFull], nextPage: String?) {
        self.rankings = rankings
        self.nextPage = nextPage
        
        asyncConfigureView()
    }
}
