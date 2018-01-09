import UIKit
import FacebookCore
import FacebookLogin

class SignInViewController : UIViewController, APILoginDelegate {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var fbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isUserInteractionEnabled = false
        self.navigationController!.navigationBar.tintColor = UIColor.lightGray
        
        fbButton.addTarget(self, action:#selector(loginButtonClicked(sender:)), for: .touchUpInside)
        loadingImage.image = PlaceholderImages.loadingBar
        loadingImage.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(api.signedIn) {
            handleLogin()
        }
    }
    
    private func handleLogin() {
        loadingImage.isHidden = true
        
        navigationController!.navigationBar.isUserInteractionEnabled = true
        navigationController!.navigationBar.tintColor = UIColor.blue
        
        if (navigationController!.popViewController(animated: true) == nil) {
            performSegue(withIdentifier: "updates", sender: nil)
        }
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked(sender: UIButton) {
        loadingImage.isHidden = false
        LoginManager().logIn(readPermissions: [.publicProfile, .email, .userFriends], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                DispatchQueue.main.async(execute: {
                    self.loadingImage.isHidden = true
                    self.easyAlert(error.localizedDescription)
                })
            case .cancelled:
                DispatchQueue.main.async(execute: {
                    self.loadingImage.isHidden = true
                })
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                NSLog("Logged in via facebook.  grantedPermissions: \(grantedPermissions) declinedPermissions: \(declinedPermissions) accessToken: \(accessToken)")
                api.login(fbAuthToken: accessToken.authenticationToken, delegate: self)
            }
        }
    }
    
    func handleAPILogin() {
        DispatchQueue.main.async(execute: {
            self.handleLogin()
        })
    }
}

