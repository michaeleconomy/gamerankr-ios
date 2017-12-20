import UIKit

class GameViewController : UIViewController, APIGameDetailDelegate, APIMyGamesManagerDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
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
                self.game = gameDetail?.fragments.gameBasic
            }
        }
    }
    var game: GameBasic? {
        didSet {
            if(game != nil) {
                if(gameDetail != nil && gameDetail!.id != game!.id) {
                    NSLog("clearing old gameDetail: \(gameDetail!.id)")
                    self.gameDetail = nil
                }
                if(gameDetail == nil) {
                    api.gameDetail(id: game!.id, delegate: self)
                }
                self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
                if (ranking != nil) {
                    NSLog("found rating for game")
                }
                else {
                    NSLog("did not find rating for game")
                }
            }
            
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    var ranking: RankingBasic?
    
    func configureView() {
        if (game != nil) {
            self.title = game!.title
            
            if (gameDetail != nil) {
                let port = gameDetail!.ports.first
                if (port != nil && port?.mediumImageUrl != nil){
                    self.imageView?.kf.indicatorType = .activity
                    self.imageView?.kf.setImage(with: URL(string: port!.mediumImageUrl!)!, options: [.keepCurrentImageWhileLoading])
                }
            }
            else {
                let port = game!.ports.first
                if (port != nil && port?.smallImageUrl != nil){
                    self.imageView?.kf.setImage(with: URL(string: port!.smallImageUrl!)!)
                }
                else {
                    self.imageView?.image = PlaceholderImages.game
                }
            }
            
            platformsLabel?.text = game!.ports.map{$0.platform.name}.joined(separator: ", ")
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
        configureView()
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
        if (gameDetail != nil) {
            return gameDetail!.rankings.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = gameDetail!.rankings[indexPath.row]
        let user = ranking.user
        
        if (ranking.ranking != nil) {
            cell.textLabel!.text = "\(user.realName) \(ranking.verb) - \(ranking.ranking!) stars"
        }
        else {
            cell.textLabel!.text = "\(user.realName) \(ranking.verb)"
        }
        
        if (ranking.review != nil) {
            cell.detailTextLabel!.text = "\"\(ranking.review!)\""
        }
        else {
            cell.detailTextLabel!.text = ""
        }
        return cell
    }
}
