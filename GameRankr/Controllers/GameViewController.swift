import UIKit
import Apollo

class GameViewController : UIViewController, APIGameDetailDelegate, APIMyGamesManagerDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var otherPlatformsButton: UIButton!
    @IBOutlet weak var stars: UIStackView!
    @IBOutlet weak var shelveButton: UIButton!
    @IBOutlet weak var reviewStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
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
                    self.rankings = gameDetail!.rankings.edges!.map({$0!.node!})
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
                    NSLog("clearing old gameDetail: \(gameDetail!.id)")
                    self.gameDetail = nil
                    self.rankings = nil
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
    var ranking: RankingBasic?
    var rankings: [GameQuery.Data.Game.Ranking.Edge.Node]?
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
    
    func configureView() {
        if (game != nil) {
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
                otherPlatformsButton.setTitle("Other Platforms: \(otherPlatforms)", for: .normal)
            }
            
            if (gameDetail != nil) {
                let portDetail = selectedPortDetail()
                if (portDetail.mediumImageUrl != nil) {
                    self.imageView?.kf.indicatorType = .activity
                    self.imageView?.kf.setImage(with: URL(string: portDetail.mediumImageUrl!)!, options: [.keepCurrentImageWhileLoading])
                }
            }
            else {
                if (port.smallImageUrl != nil) {
                    self.imageView?.kf.setImage(with: URL(string: port.smallImageUrl!)!)
                }
                else {
                    self.imageView?.image = PlaceholderImages.game
                }
            }
            
            var starsToFill = 0
            if(ranking != nil) {
                reviewStack.isHidden = false
                let shelvesStr = ranking!.shelves.map{$0.name}.joined(separator: ", ")
                shelveButton.setTitle("Shelved: \(shelvesStr)", for: .normal)
                shelveButton.imageEdgeInsets = UIEdgeInsetsMake(0, shelveButton.frame.size.width - 25, 0, 0)
                shelveButton.backgroundColor = UIColor.white
                if (ranking!.ranking != nil) {
                    starsToFill = ranking!.ranking!
                }
                if (ranking!.review != nil && ranking!.review != "") {
                    reviewLabel.isHidden = false
                    reviewLabel.text = "\"\(ranking!.review!)\""
                    reviewButton.setTitle("Edit My Review", for: .normal)
                }
                else {
                    reviewLabel.isHidden = true
                    reviewButton.setTitle("Write a Review", for: .normal)
                }
            }
            else {
                shelveButton.setTitle("Add to My Games", for: .normal)
                shelveButton.imageEdgeInsets = UIEdgeInsetsMake(0, shelveButton.frame.size.width - 25, 0, 0)
                shelveButton.backgroundColor = UIColor.lightGray
                reviewStack.isHidden = true
            }
            
            var starNum = 1
            stars.subviews.forEach({starUntyped in
                let star = starUntyped as! UIButton
                if (starNum <= starsToFill) {
                    star.setImage(starFull, for: .normal)
                }
                else {
                    star.setImage(starEmpty, for: .normal)
                }
                starNum += 1
            })
        }
        self.reviewsTable?.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyGamesManager.sharedInstance.registerDelegate(delegate: self)
        shelveButton.layer.borderColor = UIColor.lightGray.cgColor
        shelveButton.layer.borderWidth = 2
        stars.arrangedSubviews.forEach({ subview in
            let star = subview as! UIButton
            star.addTarget(self, action: #selector(starTapped(sender:)), for: .touchUpInside)
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    @objc func starTapped(sender: UIButton) {
        if (!api.signed_in) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        
        var ranking = 1
        
        var isBefore = true
        stars.arrangedSubviews.forEach({subview in
            let star = subview as! UIButton
            if (isBefore) {
                star.setImage(starFull, for: .normal)
                if (star == sender) {
                    NSLog ("Ranking \(ranking) selected for game \(game!.title)")
                    isBefore = false
                }
            }
            else {
                star.setImage(starEmpty, for: .normal)
            }
            ranking += 1
        })
    }
    
    func handleAPI(gameDetail: GameQuery.Data.Game) {
        self.gameDetail = gameDetail
    }
    
    func handleUpdates() {
        if (ranking == nil && game != nil) {
            self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
            if (ranking != nil) {
                DispatchQueue.main.async(execute: {
                    self.configureView()
                })
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (rankings != nil) {
            return rankings!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = rankings![indexPath.row]
        let user = ranking.user
        
        if (ranking.ranking != nil) {
            cell.textLabel!.text = "\(user.realName) \(ranking.verb) - \(ranking.ranking!) stars"
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
        if (!api.signed_in) {
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
        case "showRankingDetail":
            let controller = segue.destination as! RankingViewController
            controller.ranking = ranking
        case "chooseEdition":
            let controller = segue.destination as! PortChooserViewController
            controller.game = game
            controller.selected = selectedPort().id
            controller.ranked = ranking?.port.id
        default:
            NSLog("unknown segue from game view: \(segue.identifier!)")
        }
    }
}
