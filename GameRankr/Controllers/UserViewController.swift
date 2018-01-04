import UIKit

class UserViewController : UIViewController, APIUserDetailDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var shelvesTitle: UILabel!
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var noGamesLabel: UILabel!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var rankings = [RankingWithGame]()
    var userDetail: UserDetail? {
        didSet {
            if (userDetail != nil) {
                if (user == nil) {
                    self.user = userDetail!.fragments.userBasic
                }
                else {
                    if (userDetail!.id != user!.id) {
                        self.userDetail = nil
                        return
                    }
                }
            }
        }
    }
    var user: UserBasic? {
        didSet {
            if (user != nil) {
                if (userDetail?.id != user!.id) {
                    self.userDetail = nil
                    self.rankings.removeAll()
                }
                if (userDetail == nil) {
                    api.userDetail(id: user!.id, delegate: self)
                }
            }
            
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    func configureView() {
        if (user == nil) {
            loadingImage?.isHidden = false
            scrollView?.isHidden = true
            return
        }
        
        self.navigationItem.title = user!.realName
        
        imageView?.kf.setImage(with: largePhotoUrl(), placeholder: PlaceholderImages.user)
        if (userDetail == nil) {
            loadingImage?.isHidden = false
            self.scrollView?.isHidden = true
            return
        }
        loadingImage?.isHidden = true
        self.scrollView?.isHidden = false
        
        if (userDetail!.shelves.isEmpty) {
            shelvesTitle?.isHidden = true
            shelvesStack?.isHidden = true
        }
        else {
            shelvesTitle?.isHidden = false
            shelvesStack?.isHidden = false
            shelvesStack?.subviews.forEach{ $0.removeFromSuperview()}
            for shelf in userDetail!.shelves {
                let shelfButton = UIButton()
                shelfButton.setTitle(shelf.name, for: .normal)
                shelfButton.setTitleColor(.blue, for: .normal)
                shelfButton.contentHorizontalAlignment = .left
                shelfButton.addTarget(self, action: #selector(shelfButtonTap(sender:)), for: .touchUpInside)
                shelvesStack?.addArrangedSubview(shelfButton)
            }
        }
        
        noGamesLabel?.isHidden = !rankings.isEmpty
        
        self.reviewTable?.reloadData()
    }
    
    @objc func shelfButtonTap(sender: UIButton) {
        performSegue(withIdentifier: "shelfDetail", sender: sender)
    }
    
    func largePhotoUrl() -> URL {
        return URL(string: "\(user!.photoUrl)?type=large")!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (user == nil) {
            if (api.signedOut) {
                performSegue(withIdentifier: "requireSignIn", sender: nil)
                return
            }
            api.me(delegate: self)
        }
        configureView()
    }
    
    func handleAPI(userDetail: UserDetail, rankings: [RankingWithGame], nextPage: String?) {
        self.userDetail = userDetail
        self.rankings = rankings
        
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let ranking = rankings[indexPath.row]
        let game = ranking.game
        let port = ranking.port
        
        cell.textLabel!.text = "\(user!.realName) \(ranking.verb) \(game.title)"
        cell.detailTextLabel!.text = port.platform.name
        
        if (ranking.port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.imageView?.image = PlaceholderImages.game
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from user view")
            return
        }
        switch segue.identifier! {
        case "rankingDetail":
            guard let indexPath = reviewTable.indexPathForSelectedRow else {
                NSLog("indexPath was nil")
                return
            }
            let ranking = rankings[indexPath.row]
            let controller = segue.destination as! RankingViewController
            controller.ranking = ranking.fragments.rankingBasic
            controller.game = ranking.game.fragments.gameBasic
            controller.user = user
        case "shelfDetail":
            let button = sender as! UIButton
            let shelfIndex = shelvesStack.arrangedSubviews.index(where: {$0 === button})!
            let shelf = userDetail!.shelves[shelfIndex].fragments.shelfBasic
            let controller = segue.destination as! ShelfViewController
            controller.shelf = shelf
            controller.user = user
        default:
            NSLog("unknown segue: \(segue.identifier!)")
        }
        
    }
    
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
