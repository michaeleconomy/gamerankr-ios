import UIKit

class GameViewController : UIViewController {
    var game: SearchQuery.Data.Game? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        self.title = game?.title
//        let port = game?.ports.first
//        if (port != nil){
//            self.mainImage.kf.setImage(with: URL(string: port!.smallImageUrl!)!, placeholder: PlaceholderImages.game)
//
//        }
//        platformsLabel.text = "foo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}
