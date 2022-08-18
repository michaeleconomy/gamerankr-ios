import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.addTarget(self, action:#selector(getStarted(sender:)), for: .touchUpInside)
        
    }
    
    
    @objc private func getStarted(sender: UIButton) {
        dismiss(animated: true)
        navigationController?.popToRootViewController(animated: true)
        performSegue(withIdentifier: "browse", sender: nil)
    }
}
