import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, AlertAPIErrorDelegate, UITableViewDataSource, APIUpdatesDelegate, APIAuthenticationDelegate {
    
    @IBOutlet weak var noUpdatesLabel: UILabel!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private var updates = [RankingFull]()
    private var nextPage: String?
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
    
    func handleAPI(updates: [RankingFull], nextPage: String?) {
        self.updates.append(contentsOf: updates)
        
        self.nextPage = nextPage
        
        DispatchQueue.main.async(execute: {
            self.noUpdatesLabel.isHidden = !self.updates.isEmpty
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        if (nextPage != nil && indexPath.row >= (updates.count - 15)) {
            api.updates(after: nextPage, delegate: self)
            self.nextPage = nil
            
            DispatchQueue.main.async(execute: {
                self.loadingImage.isHidden = false
            })
        }
        
        let ranking = updates[indexPath.row]
        let port = ranking.port
        let user = ranking.user
        let game = ranking.game
        
        cell.primaryLabel.text = "\(user.realName) \(ranking.verb)"
        var secondLabelText = "\(game.title) (\(port.platform.name))"
        let hasReview = ranking.review != nil && ranking.review! != ""
        if (hasReview || ranking.ranking != nil) {
            secondLabelText += "\n"
            if (ranking.ranking != nil) {
                let starsStr = String(repeating: "\u{2605}", count: ranking.ranking!)
                secondLabelText += "\(starsStr) "
            }
            if (hasReview) {
                secondLabelText += "\"\(ranking.review!)\""
            }
        }
        cell.secondaryLabel.text = secondLabelText
        
        if (port.smallImageUrl != nil) {
            cell.fixedSizeImageView.kf.indicatorType = .activity
            cell.fixedSizeImageView.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.fixedSizeImageView.image = PlaceholderImages.game
        }
        return cell
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
            let ranking = updates[indexPath.row]
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
        updates = []
        fetchedUpdates = false
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
