import UIKit
import Apollo

class ShelfViewController: UIViewController, UITableViewDataSource, APIShelfDelegate, APIUserRankingsDelegate {
    
    var shelf: ShelfBasic? {
        didSet {
            if (shelf != nil) {
                getRankings()
            }
        }
    }
    var user: UserBasic?
    var rankings = [RankingWithGame]()
    var nextPage: String?
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noRankingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (shelf == nil) {
            self.title = "Games"
        }
        else {
            self.title = "Shelf: \(shelf!.name)"
        }
        noRankingsLabel.isHidden = true
    }
    
    func handleAPIAuthenticationError() {
        //nothing for now
    }
    
    func handleAPI(rankings: [RankingWithGame], nextPage: String?) {
        self.rankings.append(contentsOf: rankings)
        self.nextPage = nextPage
        DispatchQueue.main.async(execute: {
            self.loadingImage.isHidden = true
            self.noRankingsLabel.isHidden = !self.rankings.isEmpty
            self.tableView.reloadData()
        })
    }
    
    func getRankings(getNextPage: Bool = false) {
        if (!getNextPage) {
            self.nextPage = nil
            rankings.removeAll()
            DispatchQueue.main.async(execute: {
                self.tableView?.reloadData()
            })
        }
        if (shelf != nil) {
            api.shelf(id: shelf!.id, after: nextPage, delegate: self)
        }
        else {
            api.userRankings(id: user!.id, after: nextPage, delegate: self)
        }
        self.nextPage = nil
        DispatchQueue.main.async(execute: {
            self.loadingImage?.isHidden = false
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= rankings.count - 15) {
            getRankings(getNextPage: true)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = rankings[indexPath.row]
        let game = ranking.game
        let port = ranking.port
        
        cell.textLabel!.text = game.title
        cell.detailTextLabel!.text = port.platform.name
        
        cell.imageView?.image = PlaceholderImages.game
        if (ranking.port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: ranking.port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from shelf view")
            return
        }
        switch segue.identifier! {
        case "rankingDetail":
            guard let indexPath = self.tableView?.indexPathForSelectedRow  else {
                NSLog("ShelfViewController: could not get indexPath")
                return
            }
            let ranking = rankings[indexPath.row]
            let controller = segue.destination as! RankingViewController
            controller.ranking = ranking.fragments.rankingBasic
            controller.user = user
            controller.game = ranking.game.fragments.gameBasic
        default:
            NSLog("unknown segue from shelf view: \(segue.identifier!)")
        }
    }
}
