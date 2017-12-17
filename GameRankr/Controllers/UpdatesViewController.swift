import UIKit
import FacebookCore
import FacebookLogin

class UpdatesViewController: UIViewController, AlertAPIErrorDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (api.signed_in) {
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!api.signed_in) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
        }
    }

}

