import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var stefaniaLabel: UILabel!
    @IBOutlet weak var icons8Label: UILabel!
    @IBOutlet weak var giantBombLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactButton.addTarget(self, action: #selector(contactTouch), for: .touchUpInside)
        stefaniaLabel.isUserInteractionEnabled = true
        stefaniaLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stefaniaTouched)))
        icons8Label.isUserInteractionEnabled = true
        icons8Label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(icons8Touched)))
        giantBombLabel.isUserInteractionEnabled = true
        giantBombLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(giantBombTouched)))
    }
    
    @objc func contactTouch() {
        openUrl("https://www.gamerankr.com/contact")
    }
    
    @objc func stefaniaTouched() {
        openUrl("http://www.graficheria.it")
    }
    
    @objc func icons8Touched() {
        openUrl("https://www.icons8.com")
    }
    
    @objc func giantBombTouched() {
        openUrl("https://www.giantbomb.com")
    }
}
