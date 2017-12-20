import UIKit

class GameViewController : UIViewController, APIGameDetailDelegate, APIMyGamesManagerDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stars: UIStackView!
    @IBOutlet weak var reviewStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var reviewsTable: IntrinsicTableView!
    
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
            
            if(ranking != nil) {
                reviewStack.isHidden = false
            }
            else {
                reviewStack.isHidden = true
            }
        }
        self.reviewsTable?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyGamesManager.sharedInstance.registerDelegate(delegate: self)
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
        cell.detailTextLabel!.text = ranking.review
        return cell
    }
}
