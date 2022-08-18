import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, UITableViewDataSource, APIUpdatesDelegate, APIAuthenticationDelegate, FullRankingDataSource {
    
    @IBOutlet weak var noUpdatesLabel: UILabel!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToUpdates(segue: UIStoryboardSegue) {
        
    }
    
    private var nextPage: String?
    var fetchedUpdates = false
    var rankings = [RankingFull]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        api.register(authenticationDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (api.signedOut) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        
        if (!fetchedUpdates) {
            fetchedUpdates = true
            loadingImage.isHidden = false
            api.updates(delegate: self)
        }
    }
    
    func handleAPI(updates: [RankingFull], nextPage: String?) {
        self.rankings.append(contentsOf: updates)
        
        self.nextPage = nextPage
        
        DispatchQueue.main.async {
            self.noUpdatesLabel.isHidden = !self.rankings.isEmpty
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        }
    }
    
    func getNextPage() {
        api.updates(after: nextPage, delegate: self)
        self.nextPage = nil
        
        DispatchQueue.main.async {
            self.loadingImage.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            getNextPage()
        }
        let ranking = rankings[indexPath.row] // - index out of bounds here
        return cellFor(ranking: ranking, tableView: tableView, indexPath: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier from shelf view")
            return
        }
        switch identifier {
        case "requireSignIn": ()
        case "rankingDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected controller type for segue: \(identifier)")
                return
            }
            let ranking = rankings[indexPath.row]
            controller.ranking = ranking.fragments.rankingWithGame.fragments.rankingBasic
            controller.user = ranking.user?.fragments.userBasic
            controller.game = ranking.fragments.rankingWithGame.game?.fragments.gameBasic
        default:
            silentError("unhandled segue identifier: \(identifier)")
        }
    }
    
    func handleAPILogin() {
        fetchedUpdates = true
        api.updates(delegate: self)
        
        DispatchQueue.main.async(execute: {
            self.loadingImage.isHidden = false
        })
    }
    
    func handleAPILogout() {
        rankings.removeAll()
        fetchedUpdates = false
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
}
