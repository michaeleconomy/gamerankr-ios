import UIKit
import FacebookLogin

class SignOutViewController: UIViewController {
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOutButton.addTarget(self, action: #selector(signOutTouch(sender:)), for: .touchUpInside)
    }
    
    @objc func signOutTouch(sender: UIButton) {
        LoginManager().logOut()
        api.logout()
        performSegue(withIdentifier: "requireSignIn", sender: nil)
    }
}
