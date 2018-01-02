import UIKit

class FriendsController : UIViewController, APIFriendsDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [UserBasic]()
    var fetchedFriends = false
    var nextPage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingImage.image = PlaceholderImages.loadingBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!api.signed_in) {
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
        cell.imageView?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user)
        return cell
    }
    
    func handleAPI(friends: [UserBasic], nextPage: String?) {
        self.friends.append(contentsOf: friends)
        self.nextPage = nextPage
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
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
        case "userDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("tableView.indexPathForSelectedRow was nil")
                return
            }
        
            let controller = segue.destination as! UserViewController
            controller.user = friends[indexPath.row]
        default:
            NSLog("updates view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
}
