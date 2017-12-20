import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, AlertAPIErrorDelegate, UITableViewDataSource, APIUpdatesDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var updates : [RankingWithUser] = []
    var fetchedUpdates = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (api.signed_in) {
            if !fetchedUpdates {
                fetchedUpdates = true
                api.updates(delegate: self)
            }
        }
        else {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
        
    }
    
    func handleAPI(updates: [RankingWithUser]) {
        self.updates = updates
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
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

}

