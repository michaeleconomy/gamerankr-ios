import UIKit

class GameViewController : UIViewController {
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var game: GameBasic? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if (game != nil) {
            self.title = game!.title
            let port = game!.ports.first
            if (port != nil){
                self.imageView?.kf.setImage(with: URL(string: port!.smallImageUrl!)!)
            }
            
            platformsLabel?.text = game!.ports.map{$0.platform.name}.joined(separator: ", ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}
