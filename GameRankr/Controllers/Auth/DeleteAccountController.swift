import UIKit

class DeleteAccountController: UIViewController {
    @IBOutlet weak var contactButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactButton.addTarget(self, action: #selector(signOutTouch(sender:)), for: .touchUpInside)
    }
    
    @objc func signOutTouch(sender: UIButton) {
        openUrl("https://www.gamerankr.com/contact")
    }
}
