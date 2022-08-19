import UIKit

class MyGamesViewController: UIViewController, UITableViewDataSource, APIMyGamesManagerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var noGamesLabel: UILabel!
    @IBOutlet weak var noFilterMatchesLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var filter: RankingFilter? {
        didSet {
            applyFilter()
        }
    }
    
    var filteredRankings: [RankingWithGame]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        self.tableView.contentOffset = CGPoint(x: 0.0, y: 44.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (api.signedOut) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
        MyGamesManager.sharedInstance.register(delegate: self)
        configureView()
    }
    
    func configureView() {
        loadingImage?.isHidden = !MyGamesManager.sharedInstance.loading()
        
        noGamesLabel?.isHidden = MyGamesManager.sharedInstance.count() > 0 || MyGamesManager.sharedInstance.loading()
        noFilterMatchesLabel?.isHidden = MyGamesManager.sharedInstance.count() == 0 || filter == nil || !filteredRankings!.isEmpty
        tableView.reloadData()
        if (filter == nil) {
            filterButton.tintColor = .gray
        }
        else {
            filterButton.tintColor = .blue
        }
    }
    
    private func applyFilter() {
        if (filter != nil) {
            filteredRankings = filter?.apply(rankings:  MyGamesManager.sharedInstance.rankings)
        }
        else {
            filteredRankings = nil
        }
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func getCurrentRankingArray() -> [RankingWithGame] {
        if (filter == nil) {
            return MyGamesManager.sharedInstance.rankings
        }
        return filteredRankings!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCurrentRankingArray().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        let ranking = getCurrentRankingArray()[indexPath.row]
        let game = ranking.game
        let rankingBasic = ranking.fragments.rankingBasic
        let port = rankingBasic.port
        
        cell.primaryLabel!.text = game?.fragments.gameBasic.title ?? "unknown"
        var secondaryText = ""
        if (rankingBasic.ranking != nil) {
            secondaryText += String(repeating: "\u{2605}", count: rankingBasic.ranking!) + " "
        }
        secondaryText += port?.platform.shortName ?? "UKN"
        if (rankingBasic.review != nil && rankingBasic.review != "") {
            secondaryText += " - review"
        }
        secondaryText += "\nShelves: " + rankingBasic.shelves.map{$0.fragments.shelfBasic.name}.joined(separator: ", ")
        
        if (rankingBasic.commentsCount > 0) {
            secondaryText += "\n\(rankingBasic.commentsCount) comment"
            if (rankingBasic.commentsCount > 1) {
                secondaryText += "s"
            }
        }
        cell.secondaryLabel!.text = secondaryText
        
        cell.fixedSizeImageView!.image = PlaceholderImages.game
        if (rankingBasic.port?.smallImageUrl != nil) {
            cell.fixedSizeImageView!.kf.indicatorType = .activity
            cell.fixedSizeImageView!.kf.setImage(with: URL(string: rankingBasic.port!.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        return cell
    }
    
    func handleUpdates() {
        applyFilter()
    }
    
    func searchBar(_: UISearchBar, textDidChange: String) {
        if (filter == nil) {
            filter = RankingFilter()
        }
        filter!.text = textDidChange
        applyFilter()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier")
            return
        }
        switch identifier {
        case "gameDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                unexpectedError("my games: tableView.indexPathForSelectedRow was nil")
                return
            }
            guard let controller = segue.destination as? GameViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            let ranking = getCurrentRankingArray()[indexPath.row]
            controller.game = ranking.game?.fragments.gameBasic
            if let port = ranking.fragments.rankingBasic.port {
                controller.selectPort(portId: port.id)
            }
        case "requireSignIn": ()
        case "filter":
            guard let controller = segue.destination as? MyGamesFilterViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.filter = filter ?? RankingFilter()
            controller.callingController = self
        default:
            silentError("my games view: unhandled segue identifier: \(identifier)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
}
