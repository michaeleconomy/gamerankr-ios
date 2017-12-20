import UIKit

class UserViewController : UIViewController, APIUserDetailDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var userDetail: UserDetail? {
        didSet {
            if (userDetail != nil) {
                self.user = userDetail!.fragments.userBasic
            }
        }
    }
    var user: UserBasic? {
        didSet {
            if(user != nil) {
                if(userDetail?.id != user!.id) {
                    self.userDetail = nil
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
        NSLog("configuring view: \(String(describing: user?.id)) \(String(describing: userDetail?.id))")
        if (user != nil) {
            self.navigationItem.title = user!.realName
            
            self.imageView?.kf.setImage(with: URL(string: user!.photoUrl)!, placeholder: PlaceholderImages.user)
            
            if (userDetail != nil) {
                shelvesStack?.subviews.forEach{ $0.removeFromSuperview()}
                userDetail!.shelves.forEach { shelf in
                    let shelfLabel = UILabel()
                    shelfLabel.text = shelf.name
                    shelvesStack?.addArrangedSubview(shelfLabel)
                }
            }
            self.reviewTable?.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (user == nil) {
            if (api.signed_in) {
                api.me(delegate: self)
            }
            else {
                performSegue(withIdentifier: "requireSignIn", sender: nil)
            }
        }
        configureView()
    }
    
    
    func handleAPI(userDetail: UserDetail) {
        NSLog("recieved userDetail: \(userDetail.id)")
        self.userDetail = userDetail
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (userDetail != nil) {
            return userDetail!.rankings.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let ranking = userDetail!.rankings[indexPath.row]
        let game = ranking.game
        let port = ranking.port
        
        cell.textLabel!.text = "\(user!.realName) \(ranking.verb) \(game.title)"
        cell.detailTextLabel!.text = port.platform.name
        
        if (ranking.port.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: port.smallImageUrl!)!, placeholder: PlaceholderImages.game)
        }
        else {
            cell.imageView?.image = PlaceholderImages.game
        }
        return cell
    }
    
}
