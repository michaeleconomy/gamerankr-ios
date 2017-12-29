import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, AlertAPIErrorDelegate, UITableViewDataSource, APIUpdatesDelegate, APIAuthenticationDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var updates = [RankingWithUser]()
    var fetchedUpdates = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
        api.register(authenticationDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!api.signed_in) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        
        if (!fetchedUpdates) {
            fetchedUpdates = true
            loadingImage.isHidden = false
            api.updates(delegate: self)
        }
    }
    
    func handleAPI(updates: [RankingWithUser], nextPage: String?) {
        self.updates = updates
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = updates[indexPath.row]
        let port = ranking.port
        let user = ranking.user
        let game = ranking.game
        
        cell.textLabel!.text = "\(user.realName) \(ranking.verb) \(game.title)"
        cell.detailTextLabel!.text = port.platform.name
        
        if (port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game)
        }
        else {
            cell.imageView?.image = PlaceholderImages.game
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! GameViewController
                controller.game = updates[indexPath.row].game.fragments.gameBasic
                
            }
        }
    }
    
    
    func handleAPILogin() {
        //nothing for now
    }
    
    func handleAPILogout() {
        updates = []
        fetchedUpdates = false
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
