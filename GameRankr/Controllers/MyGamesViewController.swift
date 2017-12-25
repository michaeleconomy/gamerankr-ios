import UIKit

class MyGamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  APIMyGamesManagerDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        MyGamesManager.sharedInstance.registerDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!api.signed_in) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
        self.loadingImage.isHidden = !MyGamesManager.sharedInstance.loading()
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
            self.loadingImage.isHidden = !MyGamesManager.sharedInstance.loading()
            self.tableView.reloadData()
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! GameViewController
                let ranking = MyGamesManager.sharedInstance[indexPath.row]!
                controller.game = ranking.game.fragments.gameBasic
                controller.selectPort(portId: ranking.port.id)
            }
        }
    }
    
}


