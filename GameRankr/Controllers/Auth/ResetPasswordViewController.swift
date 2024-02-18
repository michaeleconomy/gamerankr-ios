import UIKit

class ResetPasswordViewController: UIViewController, APIGenericSuccessDelegate {
    private var retrying: Bool = false
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var loading: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetPasswordButton.addTarget(self, action:#selector(resetPassword(sender:)), for: .touchUpInside)
    }
    
    
    @objc private func resetPassword(sender: UIButton) {
        loading.isHidden = false
        api.resetPasswordRequest(email: emailField.text!, delegate: self)
    }
    
    func handleAPISuccess() {
        DispatchQueue.main.async {
            self.loading.isHidden = true
            self.easyAlert("A password reset email has been sent to: \(self.emailField.text!).  Follow the instructions in the email to reset your password.", handler: { alert in
                self.performSegue(withIdentifier: "signin", sender: nil)
            })
        }
    }
    
    func handleAPI(error: String) {
        DispatchQueue.main.async {
            self.easyAlert(error)
            self.loading.isHidden = true
        }
    }
    
}
