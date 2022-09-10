import UIKit
import FacebookCore
import FacebookLogin
import AuthenticationServices

class SignInViewController: UIViewController, APILoginDelegate, ASAuthorizationControllerDelegate {

    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func unwindToSignIn(segue: UIStoryboardSegue) {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        
        fbButton.addTarget(self, action:#selector(fbLoginButtonClicked(sender:)), for: .touchUpInside)
        appleButton.addTarget(self, action: #selector(appleButtonClicked(sender:)), for: .touchUpInside)
        signInButton.addTarget(self, action:#selector(signInButtonClicked(sender:)), for: .touchUpInside)
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
        loadingDone()
        
        dismiss(animated: true)
        navigationController?.popToRootViewController(animated: true)
        performSegue(withIdentifier: "updates", sender: nil)
    }
    
    
    func handleLoginUnverified() {
        loadingDone()
        performSegue(withIdentifier: "verify", sender: nil)
    }
    
    
    
    private func loadingDone() {
        loadingImage.isHidden = true
        
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    // Once the button is clicked, show the login dialog
    @objc func fbLoginButtonClicked(sender: UIButton) {
        loadingImage.isHidden = false
        LoginManager().logIn(permissions: [.publicProfile, .email, .userFriends], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                DispatchQueue.main.async(execute: {
                    self.loadingImage.isHidden = true
                    NSLog("failure with facebook sign in: \(error.localizedDescription)")
                    self.easyAlert(error.localizedDescription)
                })
            case .cancelled:
                DispatchQueue.main.async(execute: {
                    self.loadingImage.isHidden = true
                })
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                NSLog("Logged in via facebook.  grantedPermissions: \(grantedPermissions) declinedPermissions: \(declinedPermissions) accessToken: \(accessToken)")
                api.login(fbAuthToken: accessToken.tokenString, delegate: self)
            }
        }
    }
    
    @objc func appleButtonClicked(sender: UIButton?) {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.performRequests()
        }
        else {
            easyAlert("AppleID is not available on your device")
        }
    }
    
    @objc func signInButtonClicked(sender: UIButton?) {
        loadingImage.isHidden = false
        api.login(email: emailField.text!, password: passwordField.text!, delegate: self)
    }
    
    func handleAPILogin() {
        DispatchQueue.main.async(execute: {
            self.handleLogin()
        })
    }
    
    func handleAPILoginUnverified() {
        DispatchQueue.main.async(execute: {
            self.handleLoginUnverified()
        })
    }
    
    func handleAPI(error: String) {
        DispatchQueue.main.async {
            self.easyAlert(error)
            self.loadingImage.isHidden = true
        }
    }
    
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential else {
            unexpectedError("Could not get Apple ID Credential")
            return
        }
        
        guard let tokenRaw = appleIDCredential.identityToken else {
            easyAlert("Apple ID did not provide token")
            return
        }
        
        let jwt = JWTDecode.decode(jwtRaw: tokenRaw)
        NSLog("token decoded: \(String(describing: jwt))")
        
        guard let email = jwt["email"] as? String else {
            easyAlert("Apple ID did not provide an email address")
            return
        }
        
        guard let sub = jwt["sub"] as? String else {
            easyAlert("Apple ID did not provide sub")
            return
        }
        
        emailField.text = email
        passwordField.text = sub
        
        signInButtonClicked(sender: nil)
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        unexpectedError("Error with Apple ID: " + error.localizedDescription)
    }
}
