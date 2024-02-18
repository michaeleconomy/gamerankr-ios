import UIKit

class UpdatesViewController: FullRankingDataSource, APIUpdatesDelegate, APIAuthenticationDelegate {
    
    @IBOutlet weak var noUpdatesLabel: UILabel!
    @IBOutlet weak var loadingImage: UIImageView!
    
    @IBAction func unwindToUpdates(segue: UIStoryboardSegue) {
        
    }
    
    private var nextPage = GraphQLNullable<String>.none
    var fetchedUpdates = false
    
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
    
    func handleAPI(updates: [Api.RankingFull], nextPage: GraphQLNullable<String>) {
        self.rankings.append(contentsOf: updates)
        
        self.nextPage = nextPage
        
        DispatchQueue.main.async {
            self.noUpdatesLabel?.isHidden = !self.rankings.isEmpty
            self.table?.reloadData()
            self.loadingImage?.isHidden = true
        }
    }
    
    func getNextPage() {
        api.updates(after: nextPage, delegate: self)
        self.nextPage = nil
        
        DispatchQueue.main.async {
            self.loadingImage?.isHidden = false
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            getNextPage()
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier from shelf view")
            return
        }
        switch identifier {
        case "requireSignIn": ()
        case "rankingDetail":
            guard let indexPath = table.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            guard let controller = segue.destination as? RankingViewController else {
                unexpectedError("unexpected controller type for segue: \(identifier)")
                return
            }
            let ranking = rankings[indexPath.row]
            let rankingWithGame = ranking.fragments.rankingWithGame
            controller.ranking = rankingWithGame.fragments.rankingBasic
            controller.user = ranking.user?.fragments.userBasic
            controller.game = rankingWithGame.game?.fragments.gameBasic
        default:
            silentError("unhandled segue identifier: \(identifier)")
        }
    }
    
    func handleAPILogin() {
        fetchedUpdates = true
        api.updates(delegate: self)
        
        DispatchQueue.main.async {
            self.loadingImage.isHidden = false
        }
    }
    
    func handleAPILogout() {
        rankings.removeAll()
        fetchedUpdates = false
        
        DispatchQueue.main.async {
            self.table?.reloadData()
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
}
