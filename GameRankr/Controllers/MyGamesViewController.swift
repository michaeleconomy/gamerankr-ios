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
        let port = ranking.port
        
        cell.primaryLabel!.text = game.title
        var secondaryText = ""
        if (ranking.ranking != nil) {
            secondaryText += String(repeating: "\u{2605}", count: ranking.ranking!) + " "
        }
        secondaryText += port.platform.name
        if (ranking.review != nil && ranking.review != "") {
            secondaryText += " - review"
        }
        secondaryText += "\nShelves: " + ranking.shelves.map{$0.name}.joined(separator: ", ")
        
        if (ranking.commentsCount > 0) {
            secondaryText += "\n\(ranking.commentsCount) comment"
            if (ranking.commentsCount > 1) {
                secondaryText += "s"
            }
        }
        cell.secondaryLabel!.text = secondaryText
        
        cell.fixedSizeImageView!.image = PlaceholderImages.game
        if (ranking.port.smallImageUrl != nil) {
            cell.fixedSizeImageView!.kf.indicatorType = .activity
            cell.fixedSizeImageView!.kf.setImage(with: URL(string: ranking.port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from my games view")
            return
        }
        switch segue.identifier! {
        case "gameDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("my games: tableView.indexPathForSelectedRow was nil")
                return
            }
            let controller = segue.destination as! GameViewController
            let ranking = getCurrentRankingArray()[indexPath.row]
            controller.game = ranking.game.fragments.gameBasic
            controller.selectPort(portId: ranking.port.id)
        case "requireSignIn": ()
        case "filter":
            let controller = segue.destination as! MyGamesFilterViewController
            controller.filter = filter ?? RankingFilter()
            controller.callingController = self
        default:
            NSLog("my games view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
