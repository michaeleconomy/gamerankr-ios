import UIKit
import Apollo

class GameViewController : UIViewController, APIGameDetailDelegate, APIGameRankingsDelegate, APIMyGamesManagerDelegate, UITableViewDataSource, APIAuthenticationDelegate {
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var loadingImage: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // details section
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var otherPlatformsButton: UIButton!
    @IBOutlet weak var unexpandedConstraint: NSLayoutConstraint!
    @IBOutlet weak var expandedConstraint: NSLayoutConstraint!
    @IBOutlet weak var gameDescription: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var originalReleaseDateLabel: UILabel!
    @IBOutlet weak var originalReleaseRow: UIView!
    @IBOutlet weak var editionRatingsCountLabel: UILabel!
    @IBOutlet weak var editionRatingsDescriptorLabel: UILabel!
    @IBOutlet weak var editionRatingsRow: UIView!
    @IBOutlet weak var editionAverageLabel: UILabel!
    @IBOutlet weak var allRankingsRow: UIView!
    @IBOutlet weak var allRatingsCountLabel: UILabel!
    @IBOutlet weak var allRatingsDescriptorLabel: UILabel!
    @IBOutlet weak var allAverageLabel: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var expandDetailsButton: UIButton!
    
    // my reviews secrion
    @IBOutlet weak var stars: UIStackView!
    @IBOutlet weak var shelveButton: UIButton!
    @IBOutlet weak var reviewStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var reviewPlatformLabel: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var switchEditionButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    
    
    @IBOutlet weak var noRankingsLabel: UILabel!
    @IBOutlet weak var reviewsTable: IntrinsicTableView!
    
    let starFull = UIImage(named: "star-large-full")
    let starEmpty = UIImage(named: "star-large-empty")
    
    
    var nextPage: String?
    var ranking: RankingWithGame?
    var rankings = [RankingWithUser]()
    var friendRankings = [RankingWithUser]()
    var portId: GraphQLID?
    
    private var expanded = false
    
    var gameDetail: GameQuery.Data.Game? {
        didSet {
            if (gameDetail != nil) {
                if (gameDetail!.fragments.gameBasic.id != game!.id) {
                    self.gameDetail = nil
                }
                else {
                    DispatchQueue.main.async {
                        self.configureView()
                    }
                }
            }
        }
    }
    var game: GameBasic? {
        didSet {
            if(game != nil) {
                if(gameDetail != nil && gameDetail!.fragments.gameBasic.id != game!.id) {
                    self.gameDetail = nil
                    self.rankings.removeAll()
                }
                if (gameDetail == nil) {
                    api.gameDetail(id: game!.id, delegate: self)
                }
                self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
            }
            self.portId = nil
            
            DispatchQueue.main.async {
                self.configureView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        stars.arrangedSubviews.forEach({ subview in
            let star = subview as! UIButton
            star.addTarget(self, action: #selector(starTapped(sender:)), for: .touchUpInside)
        })
        switchEditionButton.addTarget(self, action: #selector(switchEditions(sender:)), for: .touchUpInside)
        api.register(authenticationDelegate: self)
        shareButton.target = self
        shareButton.action = #selector(shareGame)
        
        expandDetailsButton.addTarget(self, action: #selector(expandDetails), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        MyGamesManager.sharedInstance.register(delegate: self)
        gameDescription.numberOfLines = 3
    }
    
    func selectPort(portId: GraphQLID) {
        self.portId = portId
    }
    
    func selectedPort() -> GameBasic.Port {
        if (portId != nil) {
            return game!.ports.first(where: {$0.id == portId!})!
        }
        return game!.ports.first!
    }
    
    func selectedPortDetail() -> GameBasic.Port? {
        guard let gameDetail = gameDetail else {
            return nil
        }
        if let portId = portId {
            return gameDetail.fragments.gameBasic.ports.first(where: {$0.id == portId})
        }
        return gameDetail.fragments.gameBasic.ports.first
    }
    
    func getGameDescription() -> String {
        guard let gameDetail = gameDetail else {
            return ""
        }
        if let portId = portId {
            return gameDetail.ports.first(where: {$0.id == portId})?.description ?? ""
        }
        return gameDetail.ports.first?.description ?? ""
    }
    
    func isLoading() -> Bool {
        return MyGamesManager.sharedInstance.loading() || gameDetail == nil
    }
    
    func configureView() {
        if !isViewLoaded {
            return
        }
        loadingImage?.isHidden = !isLoading()
        self.reviewsTable?.reloadData()
        guard let game = game else {
            unexpectedError("GameViewController - game was not set!")
            return
        }
    
        let port = selectedPort()
        title = game.title
        platformLabel?.text = port.platform.name
        releaseDateLabel?.text = Formatter.format(dateString: port.releasedAt)
        editionRatingsCountLabel?.text = Formatter.format(port.rankingsCount)
        if port.rankingsCount == 0 {
            editionRatingsDescriptorLabel?.text = "rankings"
            editionAverageLabel?.text = ""
        }
        else {
            editionRatingsDescriptorLabel?.text = "rankings, Avg rating:"
            editionAverageLabel?.text = Formatter.format(port.averageRanking)
        }
        
        let remainingPorts = game.ports.filter({$0.id != port.id})
        if (remainingPorts.isEmpty) {
            otherPlatformsButton?.isHidden = true
            originalReleaseRow?.isHidden = true
            allRankingsRow?.isHidden = true
            platformsLabel?.isHidden = true
            editionRatingsRow.isHidden = false
        }
        else {
            originalReleaseRow?.isHidden = false
            otherPlatformsButton?.isHidden = false
            allRankingsRow?.isHidden = false
            platformsLabel?.isHidden = false
            
            platformsLabel?.text = "All Platforms: " + remainingPorts.map{$0.platform.name}.joined(separator: ", ")
            
            originalReleaseDateLabel?.text = Formatter.format(dateString: game.initiallyReleasedAt)
            
            allAverageLabel?.text = Formatter.format(game.averageRanking)
            allRatingsCountLabel?.text = Formatter.format(game.rankingsCount)
            if game.rankingsCount == 0 {
                allRatingsDescriptorLabel?.text = "rankings"
                allAverageLabel?.text = ""
                editionRatingsRow.isHidden = true
            }
            else {
                allRatingsDescriptorLabel?.text = "rankings, Avg rating:"
                allAverageLabel?.text = Formatter.format(port.averageRanking)
                editionRatingsRow?.isHidden = false
            }
        }
        
        configureViewWithRanking()
        if gameDetail == nil {
            gameDescription?.isHidden = true
            if let imageUrl = port.smallImageUrl {
                imageView?.kf.setImage(with: URL(string: imageUrl)!)
            }
            else {
                imageView?.image = PlaceholderImages.game
            }
            noRankingsLabel?.isHidden = true
            return
        }
        
        let portDetail = selectedPortDetail()
        if let imageUrl = portDetail?.mediumImageUrl {
            imageView?.kf.indicatorType = .activity
            imageView?.kf.setImage(with: URL(string: imageUrl)!, options: [.keepCurrentImageWhileLoading])
        }
        let description = getGameDescription()
        if description != "" {
            gameDescription?.text = description
            gameDescription?.isHidden = false
        }
        else {
            gameDescription?.isHidden = true
        }
        
        noRankingsLabel?.isHidden = !rankings.isEmpty
    }
    
    private func configureViewWithRanking() {
        guard let ranking = ranking else {
            shelveButton?.setTitle("Add to My Games", for: .normal)
            reviewStack?.isHidden = true
            setStars(0)
            return
        }
        let rankingBasic = ranking.fragments.rankingBasic
        let selectedPort = selectedPort()
        if (rankingBasic.port?.id == selectedPort.id) {
            switchEditionButton?.isHidden = true
        }
        else {
            switchEditionButton?.isHidden = false
            switchEditionButton?.setTitle("Switch to \(selectedPort.platform.name)", for: .normal)
        }
        reviewStack?.isHidden = false
        
        setStars(rankingBasic.ranking ?? 0)
        
        reviewDateLabel?.text = Formatter.formatDate(rankingBasic.updatedAt)
        reviewPlatformLabel?.text = rankingBasic.port?.platform.name ?? "UKN"

        let shelfNames = rankingBasic.shelves.map{$0.fragments.shelfBasic.name}
        let shelvesStr = shelfNames.joined(separator: ", ")
        shelveButton?.setTitle(shelvesStr, for: .normal)
        if (rankingBasic.review != nil && rankingBasic.review != "") {
            reviewLabel?.isHidden = false
            reviewLabel?.text = "\"\(rankingBasic.review!)\""
            reviewButton?.setTitle("Edit My Review", for: .normal)
        }
        else {
            reviewLabel?.isHidden = true
            reviewButton?.setTitle("Write a Review", for: .normal)
        }
        if (rankingBasic.commentsCount > 0) {
            commentsButton?.setTitle("\(rankingBasic.commentsCount) Comments", for: .normal)
            commentsButton?.isHidden = false
        }
        else {
            commentsButton?.isHidden = true
        }
    }
    
    
    @objc func shareGame() {
        share(message: "\(game!.title) - GameRankr", link: game!.url, displayFlag: true)
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
    
    @objc func expandDetails() {
        if expanded {
            expandDetailsButton.setTitle("Show Details", for: .normal)
            expandedConstraint.isActive = false
            unexpandedConstraint.isActive = true
            expanded = false
            return
        }
        expandDetailsButton.setTitle("Less", for: .normal)
        unexpandedConstraint.isActive = false
        expandedConstraint.isActive = true
        expanded = true
    }
    
    func starRankPort(rankingValue: Int) {
        if (ranking != nil && ranking?.fragments.rankingBasic.ranking == rankingValue) {
            // for taping on the existing ranking - remove the ranking
            setStars(0)
            rankPort(removeRanking: true)
            return
        }
        setStars(rankingValue)
        rankPort(rankingValue: rankingValue)
    }
    
    func rankPort(portId: GraphQLID? = nil, rankingValue: Int? = nil, removeRanking: Bool = false, review: String? = nil, addShelfId: GraphQLID? = nil, removeShelfId: GraphQLID? = nil) {
        let optimalPortId = portId ?? ranking?.fragments.rankingBasic.port?.id ?? selectedPort().id
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
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func handleAPI(gameDetail: GameQuery.Data.Game, rankings: [RankingWithUser], friendRankings: [RankingWithUser], nextPage: String?) {
        self.gameDetail = gameDetail
        self.nextPage = nextPage
        self.friendRankings.removeAll()
        self.friendRankings.append(contentsOf: friendRankings)
        self.rankings.removeAll()
        self.rankings.append(contentsOf: friendRankings)
        addNonFriendRankings(rankings)
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func addNonFriendRankings(_ rankings: [RankingWithUser]) {
        let nonFriendRankings = rankings.filter{ ranking in
            return !friendRankings.contains(where: {$0.fragments.rankingBasic.id == ranking.fragments.rankingBasic.id})
        }
        self.rankings.append(contentsOf: nonFriendRankings)
    }
    
    func handleUpdates() {
        if (game != nil) {
            self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
            //optimization - this is maybe extra work, but is hard to figure out if ranking changed
            DispatchQueue.main.async {
                self.configureView()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            DispatchQueue.main.async {
                self.loadingImage.isHidden = false
            }
            api.gameRankings(id: game!.id, after: nextPage, delegate: self)
            nextPage = nil
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = rankings[indexPath.row]
        
        let user = ranking.user
        let userBasic = user?.fragments.userBasic
        let rankingBasic = ranking.fragments.rankingBasic
        let userName = userBasic?.realName ?? "Unknown"
        var primaryText = "\(userName) \(rankingBasic.verb)"
        let stars = rankingBasic.ranking ?? 0
        if stars > 0 {
            primaryText += " \(String(repeating: "\u{2605}", count: stars))"
        }
        cell.textLabel?.text = primaryText
        if let photoUrl = userBasic?.photoUrl {
            cell.imageView?.kf.setImage(with: URL(string: photoUrl)!, placeholder: PlaceholderImages.user, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.imageView?.image = PlaceholderImages.user
        }
        
        let review = rankingBasic.review ?? ""
        var secondaryText = ""
        if review != "" {
            secondaryText = "\"\(review)\"\n"
        }
        secondaryText += "\(Formatter.format(dateString: rankingBasic.updatedAt))"
        if rankingBasic.commentsCount > 0 {
            secondaryText += "    \(rankingBasic.commentsCount) comments"
        }
        cell.detailTextLabel?.text = secondaryText
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
        guard let identifier = segue.identifier else {
            silentError("nil segue from game view")
            return
        }
        switch identifier {
        case "editReview":
            guard let controller = segue.destination as? EditReviewViewController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.ranking = ranking
        case "shelveGame":
            guard let controller = segue.destination as? ShelveGameController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.game = game
            controller.ranking = ranking
            controller.portId = ranking?.fragments.rankingBasic.port?.id ?? selectedPort().id
        case "rankingDetail":
            guard let indexPath = self.reviewsTable?.indexPathForSelectedRow  else {
                NSLog("GameViewController: could not get indexPath")
                return
            }
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            let selectedRanking = rankings[indexPath.row]
            controller.ranking = selectedRanking.fragments.rankingBasic
            controller.user = selectedRanking.user?.fragments.userBasic
            controller.game = game
        case "primaryRankingDetail":
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.ranking = ranking?.fragments.rankingBasic
            controller.userId = api.currentUserId
            controller.game = game
        case "chooseEdition":
            guard let controller = segue.destination as? PortChooserViewController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.game = game
            controller.selected = selectedPort().id
            controller.ranked = ranking?.fragments.rankingBasic.port?.id
        case "flag":
            guard let controller = segue.destination as? FlagViewController else {
                unexpectedError("unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.resourceType = "Game"
            controller.resourceId = game!.id
        default:
            silentError("unknown segue from game view: \(identifier)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.easyAlert("Session expired, please sign in and try again.")
            self.configureView()
        }
    }
    
    
    func handleAPILogin() {
        if (game != nil){
            api.gameDetail(id: game!.id, delegate: self)
        }
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func handleAPILogout() {
        self.ranking = nil
        self.friendRankings.removeAll()
        DispatchQueue.main.async {
            self.configureView()
        }
    }
}
