import UIKit
import FacebookCore
import FacebookLogin

class FirstViewController: UIViewController, AlertAPIErrorDelegate {

    @IBOutlet weak var fbButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let accessToken = AccessToken.current {
            NSLog("accessToken: \(accessToken)")
            fbButton.isHidden = true
        }
        else {
            fbButton.addTarget(self, action:#selector(loginButtonClicked(sender:)), for: .touchUpInside)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked(sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ReadPermission.publicProfile], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                NSLog("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                NSLog("Logged in via facebook.  grantedPermissions: \(grantedPermissions) declinedPermissions: \(declinedPermissions) accessToken: \(accessToken)")
                self.fbButton.isHidden = true
                api.login(fbAuthToken: accessToken.authenticationToken, delegate: self)
            }
        }
    }
        

}

