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
                if(gameDetail?.id != game!.id) {
                    self.gameDetail = nil
                }
                api.gameDetail(id: game!.id, delegate: self)
                self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
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
                
            }
            else {
                
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
        
        cell.textLabel!.text = "\(user.realName) \(ranking.verb) - \(ranking.ranking)"
        cell.detailTextLabel!.text = ranking.review
        return cell
    }
}
