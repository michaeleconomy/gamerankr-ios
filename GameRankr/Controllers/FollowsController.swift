import UIKit
import Apollo

class FollowsController : UIViewController, APIFollowersDelegate, APIFollowingDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var loading: UIImageView!
    @IBOutlet weak var noneLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var followerFollowingSwitch: UISegmentedControl!
    
    var follows = [UserBasic]()
    var fetchedFriends = false
    var nextPage: String?
    
    var showFollowings = true
    
    var user: UserBasic?
    var userId: GraphQLID? {
        didSet {
            follows.removeAll()
            nextPage = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        followerFollowingSwitch?.selectedSegmentIndex = showFollowings ? 0 : 1
        
        followerFollowingSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)
        
        loading.image = PlaceholderImages.loadingBar
        addButton.target = self
        addButton.action = #selector(addButtonTouch(sender:))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (userId == nil) {
            if (api.signedOut) {
                performSegue(withIdentifier: "requireSignIn", sender: nil)
                return
            }
            userId = api.currentUserId
        }
        getMore()
        configureView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userId = nil
    }
    
    private func configureView() {
        title = user?.realName ?? ""
    }
    
    
    @objc func switchChanged(sender: UISegmentedControl) {
        showFollowings = followerFollowingSwitch.selectedSegmentIndex == 0
        noneLabel.text = showFollowings ? "Not following anyone." : "No followers yet"
        follows.removeAll()
        nextPage = nil
        getMore()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return follows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (follows.count - 15)) {
            getMore()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = follows[indexPath.row]
        cell.textLabel?.text = user.realName
        cell.imageView?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user, completionHandler: {
            (result) in
            cell.layoutSubviews()
        })
        return cell
    }
    
    private func getMore() {
        DispatchQueue.main.async {
            self.loading.isHidden = false
        }
        if showFollowings {
            api.following(userId: userId!, after: nextPage, delegate: self)
        }
        else {
            api.followers(userId: userId!, after: nextPage, delegate: self)
        }
        
        nextPage = nil
    }
    
    func handleAPI(followers: [UserBasic], nextPage: String?) {
        if !showFollowings {
            follows.append(contentsOf: followers)
            self.nextPage = nextPage
        }
        DispatchQueue.main.async {
            self.noneLabel?.isHidden = !self.follows.isEmpty
            self.tableView?.reloadData()
            self.loading?.isHidden = true
        }
    }
    
    func handleAPI(following: [UserBasic], nextPage: String?) {
        if showFollowings {
            follows.append(contentsOf: following)
            self.nextPage = nextPage
        }
        DispatchQueue.main.async {
            self.noneLabel?.isHidden = !self.follows.isEmpty
            self.tableView?.reloadData()
            self.loading?.isHidden = true
        }
    }
    
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            silentError("nil segue from user view")
            return
        }
        switch segue.identifier! {
        case "requireSignIn": ()
        case "userDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                unexpectedError("tableView.indexPathForSelectedRow was nil")
                return
            }
        
            guard let controller = segue.destination as? UserViewController else {
                unexpectedError("controller was not a userviewcontroller")
                return
            }
            controller.user = follows[indexPath.row]
        default:
            silentError("follows view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    @objc func addButtonTouch(sender: UIBarButtonItem) {
        share(message: "Check out my games on GameRankr", link: "https://www.gamerankr.com/")
    }
}
