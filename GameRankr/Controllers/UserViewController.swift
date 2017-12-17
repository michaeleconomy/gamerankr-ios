import UIKit

class UserViewController : UIViewController, APIUserDetailDelegate, AlertAPIErrorDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    var userDetail: UserDetail? {
        didSet {
            if (userDetail != nil) {
                self.user = userDetail?.fragments.userBasic
            }
        }
    }
    var user: UserBasic? {
        didSet {
            if(user != nil) {
                if(userDetail?.id != user!.id) {
                    self.userDetail = nil
                }
                api.userDetail(id: user!.id, delegate: self)
            }
            configureView()
        }
    }
    
    func configureView() {
        if (user != nil) {
            self.title = user?.realName
            
            self.imageView?.kf.setImage(with: URL(string: user!.photoUrl)!, placeholder: PlaceholderImages.user)
            
            if (userDetail != nil) {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    func handleAPI(userDetail: UserDetail) {
        self.userDetail = userDetail
    }
    
}
