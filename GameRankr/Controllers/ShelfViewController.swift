import UIKit
import Apollo

class ShelfViewController: UIViewController, UITableViewDataSource, APIShelfDelegate, APIUserRankingsDelegate {
    
    var shelf: ShelfBasic?
    var user: UserBasic?
    private var rankings = [RankingWithGame]()
    private var nextPage: String?
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noRankingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let shelf = shelf {
            self.title = "Shelf: \(shelf.name)"
        }
        else {
            self.title = "Games"
        }
        getRankings()
    }
    
    func getRankings(getNextPage: Bool = false) {
        if (!getNextPage) {
            self.nextPage = nil
            rankings.removeAll()
        }
        if (shelf != nil) {
            api.shelf(id: shelf!.id, after: nextPage, delegate: self)
        }
        else {
            guard let user = user else {
                unexpectedError("User was undefined")
                return
            }
            api.userRankings(id: user.id, after: nextPage, delegate: self)
        }
        self.nextPage = nil
        DispatchQueue.main.async {
            self.tableView?.reloadData()
            self.loadingImage?.isHidden = false
            self.noRankingsLabel.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= rankings.count - 15) {
            getRankings(getNextPage: true)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        let ranking = rankings[indexPath.row]
        let game = ranking.game
        let port = ranking.fragments.rankingBasic.port
        
        cell.primaryLabel?.text = game?.fragments.gameBasic.title ?? "Unknow"
        cell.secondaryLabel?.text = port?.platform.shortName ?? "UKN"
        
        cell.fixedSizeImageView?.image = PlaceholderImages.game
        if let imageUrl = port?.smallImageUrl {
            cell.fixedSizeImageView?.kf.indicatorType = .activity
            cell.fixedSizeImageView?.kf.setImage(with: URL(string: imageUrl)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier from shelf view")
            return
        }
        switch identifier {
        case "rankingDetail":
            guard let indexPath = self.tableView?.indexPathForSelectedRow  else {
                unexpectedError("ShelfViewController: could not get indexPath")
                return
            }
            let ranking = rankings[indexPath.row]
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected controller type for segue rankingDetail")
                return
            }
            controller.ranking = ranking.fragments.rankingBasic
            controller.user = user
            controller.game = ranking.game?.fragments.gameBasic
        case "requireSignIn": ()
        default:
            silentError("unknown segue from shelf view: \(identifier)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
    
    func handleAPI(rankings: [RankingWithGame], nextPage: String?) {
        self.rankings.append(contentsOf: rankings)
        self.nextPage = nextPage
        DispatchQueue.main.async {
            self.loadingImage.isHidden = true
            self.noRankingsLabel.isHidden = !self.rankings.isEmpty
            self.tableView.reloadData()
        }
    }
}
