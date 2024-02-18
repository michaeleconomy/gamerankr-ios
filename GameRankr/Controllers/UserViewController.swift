import UIKit
import Apollo

class UserViewController : UIViewController, APIUserDetailDelegate, FollowChangeDelegate, UITableViewDataSource {
    
    @IBOutlet weak var loadingImage: UIImageView!
    
    @IBOutlet weak var shelvesTitle: UILabel!
    @IBOutlet weak var shelvesStack: UIStackView!
    
    @IBOutlet weak var noGamesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var moreReviewsButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var unfollowButton: UIButton!
    
    @IBOutlet weak var gameCountButton: UIButton!
    @IBOutlet weak var followingCountButton: UIButton!
    @IBOutlet weak var followerCountButton: UIButton!
    
    
    
    var rankings = [Api.RankingWithGame]()
    var nextPage = GraphQLNullable<String>.none
    
    var userId: Api.ID? {
        didSet {
            if let userId = userId {
                userDetail = nil
                user = nil
                rankings.removeAll()
                nextPage = nil
                self.loadingImage?.isHidden = true
                api.userDetail(id: userId, delegate: self)
            }
        }
    }
    
    
    var userDetail: Api.UserDetail? {
        didSet {
            if let userDetail = userDetail {
                if (user == nil) {
                    self.user = userDetail.fragments.userBasic
                }
                else if (userDetail.fragments.userBasic.id != user!.id) {
                    self.userDetail = nil
                }
            }
        }
    }
    var user: Api.UserBasic? {
        didSet {
            if (user != nil) {
                if (userDetail?.fragments.userBasic.id != user!.id) {
                    self.userDetail = nil
                    self.rankings.removeAll()
                }
                if (userDetail == nil) {
                    api.userDetail(id: user!.id, delegate: self)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        followButton.addTarget(self, action: #selector(followTap(sender:)), for: .touchUpInside)
        unfollowButton.addTarget(self, action: #selector(unfollowTap(sender:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if user == nil && userId == nil {
            if api.signedOut {
                title = "My Profile"
                imageView.image = PlaceholderImages.user
                loadingImage?.isHidden = false
                followerCountButton?.setTitle("?", for: .normal)
                followingCountButton?.setTitle("?", for: .normal)
                gameCountButton?.setTitle("?", for: .normal)
                tableView?.reloadData()
                redrawFollowButtons()
                performSegue(withIdentifier: "requireSignIn", sender: nil)
                return
            }
            api.me(delegate: self)
        }
        configureView()
        FollowManager.sharedInstance.subscribe(delegate: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        FollowManager.sharedInstance.unsubscribe(delegate: self)
    }
    
    func configureView() {
        if !isViewLoaded {
            return
        }
        tableView?.reloadData()
        redrawFollowButtons()
        guard let user = user else {
            title = "Loading"
            imageView.image = PlaceholderImages.user
            loadingImage?.isHidden = false
            followerCountButton?.setTitle("?", for: .normal)
            followingCountButton?.setTitle("?", for: .normal)
            gameCountButton?.setTitle("?", for: .normal)
            return
        }
        
        title = user.real_name
        imageView?.kf.setImage(with: largePhotoUrl(), placeholder: PlaceholderImages.user)
        guard let userDetail = userDetail else {
            followerCountButton?.setTitle("?", for: .normal)
            followingCountButton?.setTitle("?", for: .normal)
            gameCountButton?.setTitle("?", for: .normal)
            loadingImage?.isHidden = false
            shelvesStack?.isHidden = true
            shelvesTitle?.isHidden = true
            return
        }
        
        followerCountButton?.setTitle(String(userDetail.followerCount), for: .normal)
        followingCountButton?.setTitle(String(userDetail.followingCount), for: .normal)
        gameCountButton?.setTitle(String(userDetail.rankingsCount), for: .normal)
        
        loadingImage?.isHidden = true
        
        if (userDetail.shelves.isEmpty) {
            shelvesTitle?.isHidden = true
            shelvesStack?.isHidden = true
        }
        else {
            shelvesTitle?.isHidden = false
            shelvesStack?.isHidden = false
            shelvesStack?.subviews.forEach{ $0.removeFromSuperview()}
            for shelf in userDetail.shelves {
                let shelfButton = UIButton()
                shelfButton.setTitle(shelf.fragments.shelfBasic.name, for: .normal)
                shelfButton.setTitleColor(.blue, for: .normal)
//                shelfButton.contentHorizontalAlignment = .left
                shelfButton.addTarget(self, action: #selector(shelfButtonTap(sender:)), for: .touchUpInside)
                shelvesStack?.addArrangedSubview(shelfButton)
            }
        }
        
        noGamesLabel?.isHidden = !rankings.isEmpty
        
        moreReviewsButton?.isHidden = nextPage == nil
    }
    
    func redrawFollowButtons() {
        guard let user = user else {
            followButton.isHidden = true
            unfollowButton.isHidden = true
            return
        }
        if user.id == api.currentUserId {
            followButton.isHidden = true
            unfollowButton.isHidden = true
            return
        }
        if FollowManager.sharedInstance.following(id: user.id) {
            followButton.isHidden = true
            followButton.isEnabled = true
            unfollowButton.isHidden = false
        }
        else {
            followButton.isHidden = false
            unfollowButton.isHidden = true
            unfollowButton.isEnabled = true
        }
    }
    
    @objc func shelfButtonTap(sender: UIButton) {
        performSegue(withIdentifier: "shelfDetail", sender: sender)
    }
    
    @objc func followTap(sender: UIButton) {
        guard let user = user else {
            easyAlert("User is not set")
            return
        }

        FollowManager.sharedInstance.follow(id: user.id)
        followButton.isEnabled = false
        loadingImage.isHidden = false
    }
    
    @objc func unfollowTap(sender: UIButton) {
        guard let user = user else {
            easyAlert("User is not set")
            return
        }

        FollowManager.sharedInstance.unfollow(id: user.id)
        unfollowButton.isEnabled = false
        loadingImage.isHidden = false
    }
    
    func largePhotoUrl() -> URL {
        return URL(string: "\(user!.photo_url)?type=large")!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        
        let data = rankings[indexPath.row]
        populateCell(cell: cell, with: data)
        return cell
    }
    
    func populateCell(cell: FixedImageSizeTableCell, with rankingWithGame: Api.RankingWithGame) {
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
        secondaryText.add(cell.rankingText(rankingBasic: rankingBasic))
        cell.secondaryLabel?.attributedText = secondaryText.string
        
        cell.setImage(port: port)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier from user view")
            return
        }
        switch identifier {
        case "rankingDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected controller type for segue: \(identifier)")
                return
            }
            let ranking = rankings[indexPath.row]
            controller.ranking = ranking.fragments.rankingBasic
            controller.game = ranking.game?.fragments.gameBasic
            controller.user = user
        case "shelfDetail":
            guard let userDetail = userDetail else {
                unexpectedError("No user detail available")
                return
            }

            guard let button = sender as? UIButton else {
                unexpectedError("unexpected sender type for segue: shelfDetail")
                return
            }
            let shelfIndex = shelvesStack.arrangedSubviews.index(where: {$0 === button})!
            let shelf = userDetail.shelves[shelfIndex].fragments.shelfBasic
            guard let controller = segue.destination as? ShelfViewController else {
                unexpectedError("unexpected controller for segue: shelfDetail")
                return
                
            }
            controller.shelf = shelf
            controller.user = user
        case "moreShelfDetail":
            guard let controller = segue.destination as? ShelfViewController else {
                unexpectedError("unexpected controller for segue: moreShelfDetail")
                return
                
            }
            controller.shelf = nil
            controller.user = user
        case "games":
            guard let controller = segue.destination as? ShelfViewController else {
                unexpectedError("unexpected controller for segue: games")
                return
            }
            controller.shelf = nil
            controller.user = user
        case "followers":
            guard let controller = segue.destination as? FollowsController else {
                unexpectedError("unexpected controller for segue: followers")
                return
            }
            controller.user = user
            controller.userId = user?.id
        case "following":
            guard let controller = segue.destination as? FollowsController else {
                unexpectedError("unexpected controller for segue: followers")
                return
            }
            controller.user = user
            controller.userId = user?.id
        case "requireSignIn": ()
        default:
            silentError("unknown segue from user view: \(identifier)")
        }
    }
    
    func handleAPI(userDetail: Api.UserDetail, rankings: [Api.RankingWithGame], nextPage: GraphQLNullable<String>) {
        self.userDetail = userDetail
        self.rankings = rankings
        self.nextPage = nextPage
        
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func handleFollowUpdates() {
        DispatchQueue.main.async {
            self.loadingImage?.isHidden = true
            self.redrawFollowButtons()
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
}
