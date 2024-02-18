import UIKit
class BrowseViewController: FullRankingDataSource, APIPopularGamesDelegate, APIRecentReviewsDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var gamesStack: UIStackView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var moreReviewsButton: UIButton!
    
    
    @IBAction func unwindToBrowse(segue: UIStoryboardSegue) {
        
    }
    
    private var games: [Api.GameBasic]?
    private var nextPage = GraphQLNullable<String>.none
    private var fetchedUpdates = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
        api.popularGames(delegate: self)
        api.recentReviews(delegate: self)
        configureView()
    }

    
    func configureView() {
        if games == nil {
            loadingImage?.isHidden = false
            scrollView?.isHidden = true
            return
        }
        
        scrollView?.isHidden = false
        
        if !fetchedUpdates {
            loadingImage?.isHidden = false
            reviewsLabel?.isHidden = true
            table?.isHidden = true
            moreReviewsButton?.isHidden = true
            return
        }
        reviewsLabel?.isHidden = false
        table?.isHidden = false
        moreReviewsButton?.isHidden = false
        loadingImage?.isHidden = true
        table?.reloadData()
    }
    
    func addGames() {
        for game in games! {
            let gameImage = UIButton()
            let port = game.ports.first!
            gameImage.addConstraint(gameImage.widthAnchor.constraint(equalToConstant: 60))
            gameImage.addConstraint(gameImage.heightAnchor.constraint(equalToConstant: 60))
            
            if (port.small_image_url != nil) {
                gameImage.kf.setImage(with: URL(string: port.small_image_url!)!, for: .normal, placeholder: PlaceholderImages.game)
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
        case "gameDetail":
            let button = sender as! UIButton
            guard let index = gamesStack.arrangedSubviews.firstIndex(of: button) else {
                unexpectedError("could not find button in gamesStack")
                return
            }
            guard let controller = segue.destination as? GameViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            let game = games![index]
            controller.game = game
        case "universalGameDetail":
            guard let controller = segue.destination as? GameViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
                unexpectedError("could not get appDelegate")
                return
            }
            controller.gameId = delegate.universalLinkId
        case "universalUserDetail":
            guard let controller = segue.destination as? UserViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
                unexpectedError("could not get appDelegate")
                return
            }
            controller.userId = delegate.universalLinkId
        case "moreRecentReviews":
            guard let controller = segue.destination as? RecentReviewsViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            api.recentReviews(after: nextPage, delegate: controller)
        default:
            silentError("browse view: unhandled segue identifier: \(identifier)")
        }
    }
    
    func handleAPI(games: [Api.GameBasic]) {
        self.games = games
        
        DispatchQueue.main.async {
            self.addGames()
            self.configureView()
        }
    }
    
    func handleAPI(rankings: [Api.RankingFull], nextPage: GraphQLNullable<String>) {
        self.rankings.append(contentsOf: rankings)
        fetchedUpdates = true
        self.nextPage = nextPage
        
        DispatchQueue.main.async {
            self.configureView()
        }
    }
}
