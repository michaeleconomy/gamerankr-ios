import UIKit

class UserViewController : UIViewController, APIUserDetailDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var rankings: [RankingBasic]?
    var userDetail: UserDetail? {
        didSet {
            if (userDetail != nil) {
                self.user = userDetail!.fragments.userBasic
                self.rankings = userDetail!.rankings.edges!.map({$0!.ranking!.fragments.rankingBasic})
            }
        }
    }
    var user: UserBasic? {
        didSet {
            if(user != nil) {
                if(userDetail?.id != user!.id) {
                    self.userDetail = nil
                    self.rankings = nil
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
        if (rankings != nil) {
            return rankings!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let ranking = rankings![indexPath.row]
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = reviewTable.indexPathForSelectedRow {
                let ranking = rankings![indexPath.row]
                let controller = segue.destination as! GameViewController
                let game = ranking.game.fragments.gameBasic
                controller.game = game
                controller.selectPort(portId: ranking.port.id)
            }
        }
    }
}
