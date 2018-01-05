import UIKit
import Apollo

class GameViewController : UIViewController, APIGameDetailDelegate, APIGameRankingsDelegate, APIMyGamesManagerDelegate, AlertAPIErrorDelegate, UITableViewDataSource, APIAuthenticationDelegate {
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var otherPlatformsButton: UIButton!
    @IBOutlet weak var switchEditionButton: UIButton!
    @IBOutlet weak var stars: UIStackView!
    @IBOutlet weak var shelveButton: UIButton!
    @IBOutlet weak var reviewStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var noRankingsLabel: UILabel!
    @IBOutlet weak var reviewsTable: IntrinsicTableView!
    
    let starFull = UIImage(named: "star-full-medium.png")
    let starEmpty = UIImage(named: "star-empty-medium.png")
    
    var gameDetail: GameQuery.Data.Game? {
        didSet {
            if (gameDetail != nil) {
                if (gameDetail!.id != game!.id) {
                    self.gameDetail = nil
                }
                else {
                    DispatchQueue.main.async(execute: {
                        self.configureView()
                    })
                }
            }
        }
    }
    var game: GameBasic? {
        didSet {
            if(game != nil) {
                if(gameDetail != nil && gameDetail!.id != game!.id) {
                    self.gameDetail = nil
                    self.rankings.removeAll()
                }
                if (gameDetail == nil) {
                    api.gameDetail(id: game!.id, delegate: self)
                }
                self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
            }
            self.portId = nil
            
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    var nextPage: String?
    var ranking: RankingWithGame?
    var rankings = [RankingWithUser]()
    var friendRankings = [RankingWithUser]()
    var portId: GraphQLID?
    
    func selectPort(portId: GraphQLID) {
        self.portId = portId
    }
    
    func selectedPort() -> GameBasic.Port {
        if (portId != nil) {
            return game!.ports.first(where: {$0.id == portId!})!
        }
        return game!.ports.first!
    }
    
    func selectedPortDetail() -> GameQuery.Data.Game.Port {
        if (portId != nil) {
            return gameDetail!.ports.first(where: {$0.id == portId!})!
        }
        return gameDetail!.ports.first!
    }
    
    func isLoading() -> Bool {
        return MyGamesManager.sharedInstance.loading() || gameDetail == nil
    }
    
    func configureView() {
        loadingImage?.isHidden = !isLoading()
        self.reviewsTable?.reloadData()
        if (game == nil) {
            NSLog("GameViewController - game was not set!")
            return
        }
    
        let port = selectedPort()
        self.title = game!.title
        platformLabel?.text = "Platform: \(port.platform.name)"
        
        let remainingPorts = game!.ports.filter({$0.id != port.id})
        if (remainingPorts.isEmpty) {
            otherPlatformsButton?.isHidden = true
        }
        else {
            otherPlatformsButton?.isHidden = false
            let otherPlatforms = remainingPorts.map{$0.platform.name}.joined(separator: ", ")
            otherPlatformsButton?.setTitle("Other Platforms: \(otherPlatforms)", for: .normal)
        }
        
        if (gameDetail != nil) {
            let portDetail = selectedPortDetail()
            if (portDetail.mediumImageUrl != nil) {
                self.imageView?.kf.indicatorType = .activity
                self.imageView?.kf.setImage(with: URL(string: portDetail.mediumImageUrl!)!, options: [.keepCurrentImageWhileLoading])
            }
            
            noRankingsLabel?.isHidden = !rankings.isEmpty
        }
        else {
            if (port.smallImageUrl != nil) {
                self.imageView?.kf.setImage(with: URL(string: port.smallImageUrl!)!)
            }
            else {
                self.imageView?.image = PlaceholderImages.game
            }
            noRankingsLabel?.isHidden = true
        }
        
        configureViewWithRanking()
    }
    
    private func configureViewWithRanking() {
        var starsToFill = 0
        if (ranking != nil) {
            if (ranking!.port.id == selectedPort().id) {
                switchEditionButton?.isHidden = true
            }
            else {
                switchEditionButton?.isHidden = false
            }
            reviewStack?.isHidden = false
            if (ranking!.ranking != nil) {
                starsToFill = ranking!.ranking!
            }
            let shelvesStr = ranking!.shelves.map{$0.name}.joined(separator: ", ")
            shelveButton?.setTitle("Shelved: \(shelvesStr)", for: .normal)
            shelveButton?.backgroundColor = UIColor.white
            if (ranking!.review != nil && ranking!.review != "") {
                reviewLabel?.isHidden = false
                reviewLabel?.text = "\"\(ranking!.review!)\""
                reviewButton?.setTitle("Edit My Review", for: .normal)
            }
            else {
                reviewLabel?.isHidden = true
                reviewButton?.setTitle("Write a Review", for: .normal)
            }
            if (ranking!.commentsCount > 0) {
                commentsButton.setTitle("\(ranking!.commentsCount) Comments", for: .normal)
                commentsButton.isHidden = false
            }
            else {
                commentsButton.isHidden = true
            }
        }
        else {
            switchEditionButton?.isHidden = true
            shelveButton?.setTitle("Add to My Games", for: .normal)
            shelveButton?.backgroundColor = UIColor.lightGray
            reviewStack?.isHidden = true
        }
        
        setStars(starsToFill)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        shelveButton.layer.borderColor = UIColor.lightGray.cgColor
        shelveButton.layer.borderWidth = 2
        stars.arrangedSubviews.forEach({ subview in
            let star = subview as! UIButton
            star.addTarget(self, action: #selector(starTapped(sender:)), for: .touchUpInside)
        })
        switchEditionButton.addTarget(self, action: #selector(switchEditions(sender:)), for: .touchUpInside)
        api.register(authenticationDelegate: self)
        shareButton.target = self
        shareButton.action = #selector(shareGame)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        MyGamesManager.sharedInstance.register(delegate: self)
    }
    
    @objc func shareGame() {
        share(message: "\(game!.title) - GameRankr", link: game!.url)
    }
    
    @objc func switchEditions(sender: UIButton) {
        switchEditionButton.isHidden = true
        rankPort(portId: selectedPort().id)
    }
    
    @objc func starTapped(sender: UIButton) {
        if (api.signedOut) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        
        let rankingValue = stars.arrangedSubviews.index(where: {$0 == sender})! + 1
        starRankPort(rankingValue: rankingValue)
    }
    
    func starRankPort(rankingValue: Int) {
        if (ranking != nil && ranking?.ranking == rankingValue) {
            // for taping on the existing ranking - remove the ranking
            setStars(0)
            rankPort(removeRanking: true)
            return
        }
        setStars(rankingValue)
        rankPort(rankingValue: rankingValue)
    }
    
    func rankPort(portId: GraphQLID? = nil, rankingValue: Int? = nil, removeRanking: Bool = false, review: String? = nil, addShelfId: GraphQLID? = nil, removeShelfId: GraphQLID? = nil) {
        let optimalPortId = portId ?? ranking?.port.id ?? selectedPort().id
        MyGamesManager.sharedInstance.rankPort(portId: optimalPortId, ranking: rankingValue, removeRanking: removeRanking, review: review, addShelfId: addShelfId, removeShelfId: removeShelfId)
    }
    
    func setStars(_ value: Int) {
        var i = 1
        if (stars != nil) {
            for subview in stars!.arrangedSubviews {
                let star = subview as! UIButton
                if (i <= value) {
                    star.setImage(starFull, for: .normal)
                }
                else {
                    star.setImage(starEmpty, for: .normal)
                }
                i += 1
            }
        }
    }
    
    func handleAPI(rankings: [RankingWithUser], nextPage: String?) {
        self.nextPage = nextPage
        addNonFriendRankings(rankings)
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func handleAPI(gameDetail: GameQuery.Data.Game, rankings: [RankingWithUser], friendRankings: [RankingWithUser], nextPage: String?) {
        self.gameDetail = gameDetail
        self.nextPage = nextPage
        self.friendRankings.removeAll()
        self.friendRankings.append(contentsOf: friendRankings)
        self.rankings.removeAll()
        self.rankings.append(contentsOf: friendRankings)
        addNonFriendRankings(rankings)
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func addNonFriendRankings(_ rankings: [RankingWithUser]) {
        let nonFriendRankings = rankings.filter{ ranking in
            return !friendRankings.contains(where: {$0.id == ranking.id})
        }
        self.rankings.append(contentsOf: nonFriendRankings)
    }
    
    func handleUpdates() {
        if (game != nil) {
            self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
            //TODO - this is maybe extra work, but is hard to figure out if ranking changed
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            DispatchQueue.main.async(execute: {
                self.loadingImage.isHidden = false
            })
            api.gameRankings(id: game!.id, after: nextPage, delegate: self)
            nextPage = nil
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = rankings[indexPath.row]
        let user = ranking.user
        if (ranking.ranking != nil) {
            let starsStr = String(repeating: "\u{2605}", count: ranking.ranking!)
            cell.textLabel!.text = "\(user.realName) \(ranking.verb) \(starsStr)"
        }
        else {
            cell.textLabel!.text = "\(user.realName) \(ranking.verb)"
        }
        
        if (ranking.review != nil && ranking.review! != "") {
            cell.detailTextLabel!.text = "\"\(ranking.review!)\""
        }
        else {
            cell.detailTextLabel!.text = ""
        }
        return cell
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (api.signedOut) {
            if (identifier == "editReview" || identifier == "shelveGame") {
                performSegue(withIdentifier: "requireSignIn", sender: nil)
                return false
            }
        }
        return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from game view")
            return
        }
        switch segue.identifier! {
        case "editReview":
            let controller = segue.destination as! EditReviewViewController
            controller.ranking = ranking
        case "shelveGame":
            let controller = segue.destination as! ShelveGameController
            controller.game = game
            controller.ranking = ranking
            controller.portId = ranking?.port.id ?? selectedPort().id
        case "rankingDetail":
            guard let indexPath = self.reviewsTable?.indexPathForSelectedRow  else {
                NSLog("GameViewController: could not get indexPath")
                return
            }
            let selectedRanking = rankings[indexPath.row]
            let controller = segue.destination as! RankingViewController
            controller.ranking = selectedRanking.fragments.rankingBasic
            controller.user = selectedRanking.user.fragments.userBasic
            controller.game = game
        case "primaryRankingDetail":
            let controller = segue.destination as! RankingViewController
            controller.ranking = ranking?.fragments.rankingBasic
            controller.loadCurrentUser()
            controller.game = game
        case "chooseEdition":
            let controller = segue.destination as! PortChooserViewController
            controller.game = game
            controller.selected = selectedPort().id
            controller.ranked = ranking?.port.id
        default:
            NSLog("unknown segue from game view: \(segue.identifier!)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.easyAlert("Session expired, please sign in and try again.")
            self.configureView()
        })
    }
    
    
    func handleAPILogin() {
        if (game != nil){
            api.gameDetail(id: game!.id, delegate: self)
        }
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func handleAPILogout() {
        self.ranking = nil
        self.friendRankings.removeAll()
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
}
