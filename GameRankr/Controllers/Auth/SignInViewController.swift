import UIKit
import AuthenticationServices

class SignInViewController: UIViewController, APILoginDelegate, ASAuthorizationControllerDelegate {

    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func unwindToSignIn(segue: UIStoryboardSegue) {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        
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
}
