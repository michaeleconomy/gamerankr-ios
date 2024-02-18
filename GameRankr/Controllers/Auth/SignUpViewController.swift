import UIKit
import AuthenticationServices

class SignUpViewController : UIViewController, APILoginDelegate, APIGenericSuccessDelegate, ASAuthorizationControllerDelegate {

    
    @IBOutlet weak var loadingImage: UIImageView!
    
    @IBOutlet weak var buttonStack: UIStackView!
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func unwindToSignUp(segue: UIStoryboardSegue) {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        createAccountButton.addTarget(self, action: #selector(createButtonClicked(sender:)), for: .touchUpInside)
        loadingImage.image = PlaceholderImages.loadingBar
        loadingImage.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(api.signedIn) {
            dismiss(animated: true)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    private func handleLogin() {
        loadingDone()
        
        performSegue(withIdentifier: "welcome", sender: nil)
    }
    
    
    func handleLoginUnverified() {
        loadingDone()
        performSegue(withIdentifier: "verify", sender: nil)
    }
    
    private func loadingDone() {
        loadingImage.isHidden = true
    }
    
    
    @objc func createButtonClicked(sender: UIButton?) {
        loadingImage.isHidden = false
        api.createAccount(
            email: emailField.text!,
            password: passwordField.text!,
            name: nameField.text!,
            delegate: self)
    }
    
    func handleAPISuccess() {
        handleAPILoginUnverified()
    }
    
    func handleAPI(error: String) {
        DispatchQueue.main.async {
            self.easyAlert(error)
            self.loadingImage.isHidden = true
        }
    }
    
    func handleAPILogin() {
        DispatchQueue.main.async {
            self.handleLogin()
        }
    }
    func handleAPILoginUnverified() {
        DispatchQueue.main.async {
            self.handleLoginUnverified()
        }
    }
}

