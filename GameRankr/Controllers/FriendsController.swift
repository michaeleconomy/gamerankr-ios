import UIKit

class FriendsController : UIViewController, APIFriendsDelegate, UITableViewDataSource, APIAuthenticationDelegate {
    
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var noFriendsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var friends = [UserBasic]()
    var fetchedFriends = false
    var nextPage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
        addButton.target = self
        addButton.action = #selector(addButtonTouch(sender:))
        api.register(authenticationDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (api.signedOut) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        
        if (!fetchedFriends) {
            fetchedFriends = true
            loadingImage.isHidden = false
            api.friends(delegate: self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row >= (friends.count - 15)) {
            DispatchQueue.main.async(execute: {
                self.loadingImage.isHidden = false
            })
            api.friends(after: nextPage, delegate: self)
            nextPage = nil
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = friends[indexPath.row]
        cell.textLabel!.text = user.realName
        cell.imageView?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user, completionHandler: {
            (image, error, cacheType, imageUrl) in
            cell.layoutSubviews()
        })
        return cell
    }
    
    func handleAPI(friends: [UserBasic], nextPage: String?) {
        self.friends.append(contentsOf: friends)
        self.nextPage = nextPage
        DispatchQueue.main.async(execute: {
            self.noFriendsLabel?.isHidden = !self.friends.isEmpty
            self.tableView?.reloadData()
            self.loadingImage?.isHidden = true
        })
    }
    
    
    func handleAPILogin() {
    }
    
    func handleAPILogout() {
        friends.removeAll()
        fetchedFriends = false
        nextPage = nil
    }
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from user view")
            return
        }
        switch segue.identifier! {
        case "requireSignIn": ()
        case "userDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
        
            let controller = segue.destination as! UserViewController
            controller.user = friends[indexPath.row]
        default:
            NSLog("friends view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
    
    @objc func addButtonTouch(sender: UIBarButtonItem) {
        share(message: "Check out my games on GameRanker", link: "https://www.gamerankr.com/")
    }
}
