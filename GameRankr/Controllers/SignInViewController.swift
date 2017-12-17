import UIKit
import FacebookCore
import FacebookLogin

class SignInViewController : UIViewController, APILoginDelegate, AlertAPIErrorDelegate {
    @IBOutlet weak var fbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isUserInteractionEnabled = false
        self.navigationController!.navigationBar.tintColor = UIColor.lightGray
        
        fbButton.addTarget(self, action:#selector(loginButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked(sender: UIButton) {
        LoginManager().logIn(readPermissions: [.publicProfile, .email, .userFriends], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                NSLog("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                NSLog("Logged in via facebook.  grantedPermissions: \(grantedPermissions) declinedPermissions: \(declinedPermissions) accessToken: \(accessToken)")
                api.login(fbAuthToken: accessToken.authenticationToken, delegate: self)
            }
        }
    }
    func handleAPILogin() {
        DispatchQueue.main.async(execute: {
            self.navigationController!.navigationBar.isUserInteractionEnabled = true
            self.navigationController!.navigationBar.tintColor = UIColor.blue
            
            self.navigationController!.popViewController(animated: true)
        })
    }
}

