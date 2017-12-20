import UIKit

class MyGamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  APIMyGamesManagerDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        MyGamesManager.sharedInstance.registerDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!api.signed_in) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyGamesManager.sharedInstance.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = MyGamesManager.sharedInstance[indexPath.row]!
        let game = ranking.game
        let port = ranking.port
        
        cell.textLabel!.text = game.title
        cell.detailTextLabel!.text = port.platform.name
        
        cell.imageView?.image = PlaceholderImages.game
        if (ranking.port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: ranking.port.smallImageUrl!)!, placeholder: PlaceholderImages.game)
        }
        return cell
    }
    
    
    func handleUpdates() {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! GameViewController
                controller.game = MyGamesManager.sharedInstance[indexPath.row]!.game.fragments.gameBasic
                
            }
        }
    }
    
}


