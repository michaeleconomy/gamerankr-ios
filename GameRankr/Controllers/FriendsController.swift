import UIKit

class FriendsController : UIViewController, APIFriendsDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [UserBasic] = []
    var fetchedFriends = false
    
    
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
        
        if(!fetchedFriends) {
            fetchedFriends = true
            loadingImage.isHidden = false
            api.friends(delegate: self)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = friends[indexPath.row]
        
        cell.textLabel!.text = user.realName
        cell.imageView?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user)
        
        return cell
    }
    
    
    func handleAPI(friends: [UserBasic]) {
        self.friends = friends
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            
            self.loadingImage.isHidden = true
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! UserViewController
                controller.user = friends[indexPath.row]

            }
        }
    }
}
