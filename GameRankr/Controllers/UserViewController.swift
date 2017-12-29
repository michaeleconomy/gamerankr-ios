import UIKit

class UserViewController : UIViewController, APIUserDetailDelegate, AlertAPIErrorDelegate, UITableViewDataSource {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var rankings: [RankingBasic]?
    var userDetail: UserDetail? {
        didSet {
            if (userDetail != nil) {
                self.rankings = userDetail!.rankings.edges!.map{$0!.ranking!.fragments.rankingBasic}
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
            if(user != nil) {
                if (userDetail?.id != user!.id) {
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
        if (user != nil) {
            self.navigationItem.title = user!.realName
            loadingImage?.isHidden = userDetail != nil
            
            imageView?.kf.setImage(with: largePhotoUrl(), placeholder: PlaceholderImages.user)
            
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
            if (!api.signed_in) {
                performSegue(withIdentifier: "requireSignIn", sender: nil)
                return
            }
            api.me(delegate: self)
        }
        configureView()
    }
    
    
    func handleAPI(userDetail: UserDetail) {
        self.userDetail = userDetail
        
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
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
    
    
    func handleAPIAuthenticationError() {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "requireSignIn", sender: nil)
        })
    }
}
