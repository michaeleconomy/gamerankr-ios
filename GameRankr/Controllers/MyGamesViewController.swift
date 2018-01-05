import UIKit

class MyGamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  APIMyGamesManagerDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var noGamesLabel: UILabel!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ranking = getCurrentRankingArray()[indexPath.row]
        let game = ranking.game
        let port = ranking.port
        
        cell.textLabel!.text = game.title
        cell.detailTextLabel!.text = port.platform.name
        
        cell.imageView?.image = PlaceholderImages.game
        if (ranking.port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: ranking.port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        return cell
    }
    
    func handleUpdates() {
        applyFilter()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from user view")
            return
        }
        switch segue.identifier! {
        case "gameDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
            let controller = segue.destination as! GameViewController
            let ranking = getCurrentRankingArray()[indexPath.row]
            controller.game = ranking.game.fragments.gameBasic
            controller.selectPort(portId: ranking.port.id)
        case "filter":
            let controller = segue.destination as! MyGamesFilterViewController
            controller.filter = filter ?? RankingFilter()
            controller.callingController = self
        default:
            NSLog("updates view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
