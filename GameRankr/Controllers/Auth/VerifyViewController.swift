import UIKit
import FacebookCore
import FacebookLogin

class VerifyViewController: UIViewController, APILoginDelegate, APIGenericSuccessDelegate {
    private var retrying: Bool = false
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var loading: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    private var defaultText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultText = emailLabel.text
        resendButton.isHidden = true
        resendButton.addTarget(self, action:#selector(resendVerificationEmail(sender:)), for: .touchUpInside)
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.resendButton.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(api.signedIn) {
            handleLogin()
            return
        }
        emailLabel.text = defaultText.replacingOccurrences(of: "###", with: api.email)
        retrying = true
        waitForLogin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        retrying = false
    }
    
    @objc private func resendVerificationEmail(sender: UIButton) {
        loading.isHidden = false
        resendButton.isHidden = true
        api.resendVerification(delegate: self)
    }
    
    func handleAPISuccess() {
        DispatchQueue.main.async {
            self.loading.isHidden = true
            self.easyAlert("Verification Email Resent.")
            DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                self.resendButton.isHidden = false
            }
        }
    }
    
    private func waitForLogin() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 5) {
            if (self.retrying) {
                api.retryLogin(delegate: self)
            }
        }
    }
    
    
    private func handleLogin() {
        performSegue(withIdentifier: "welcome", sender: nil)
    }
    
    func handleAPILogin() {
        DispatchQueue.main.async(execute: {
            self.handleLogin()
        })
    }
    
    func handleAPILoginUnverified() {
        if (retrying) {
            waitForLogin()
        }
    }
}
