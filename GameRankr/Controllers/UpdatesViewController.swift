import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, UITableViewDataSource, APIUpdatesDelegate, APIAuthenticationDelegate, FullRankingDataSource {
    
    @IBOutlet weak var noUpdatesLabel: UILabel!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
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
        
        DispatchQueue.main.async(execute: {
            self.noUpdatesLabel.isHidden = !self.rankings.isEmpty
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (rankings.count - 15)) {
            api.updates(after: nextPage, delegate: self)
            self.nextPage = nil
            
            DispatchQueue.main.async(execute: {
                self.loadingImage.isHidden = false
            })
        }
        let ranking = rankings[indexPath.row]
        return cellFor(ranking: ranking, tableView: tableView, indexPath: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from updatesView")
            return
        }
        switch segue.identifier! {
        case "requireSignIn": ()
        case "rankingDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            let controller = segue.destination as! RankingViewController
            let ranking = rankings[indexPath.row]
            controller.ranking = ranking.fragments.rankingBasic
            controller.user = ranking.user.fragments.userBasic
            controller.game = ranking.game.fragments.gameBasic
        default:
            NSLog("updates view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    func handleAPILogin() {
        //nothing for now
    }
    
    func handleAPILogout() {
        rankings.removeAll()
        fetchedUpdates = false
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
