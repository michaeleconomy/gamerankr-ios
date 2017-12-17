import UIKit

class GameViewController : UIViewController, APIGameDetailDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var gameDetail: GameQuery.Data.Game? {
        didSet {
            if (gameDetail != nil) {
                self.game = gameDetail?.fragments.gameBasic
            }
        }
    }
    var game: GameBasic? {
        didSet {
            if(game != nil) {
                if(gameDetail?.id != game!.id) {
                    self.gameDetail = nil
                }
                api.gameDetail(id: game!.id, delegate: self)
            }
            configureView()
        }
    }
    
    func configureView() {
        if (game != nil) {
            self.title = game!.title
            
            if (gameDetail != nil) {
                let port = gameDetail!.ports.first
                if (port != nil && port?.mediumImageUrl != nil){
                    self.imageView?.kf.indicatorType = .activity
                    self.imageView?.kf.setImage(with: URL(string: port!.mediumImageUrl!)!, options: [.keepCurrentImageWhileLoading])
                }
            }
            else {
                let port = game!.ports.first
                if (port != nil && port?.smallImageUrl != nil){
                    self.imageView?.kf.setImage(with: URL(string: port!.smallImageUrl!)!)
                }
                else {
                    self.imageView?.image = PlaceholderImages.game
                }
            }
            
            platformsLabel?.text = game!.ports.map{$0.platform.name}.joined(separator: ", ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    func handleAPI(gameDetail: GameQuery.Data.Game) {
        self.gameDetail = gameDetail
    }
    
}
