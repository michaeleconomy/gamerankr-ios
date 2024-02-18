import UIKit
import Apollo

class FlagActivity: UIActivity {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    override var activityTitle: String? {
        get {
            return "Flag Offensive Content"
        }
    }
    
    override var activityType: UIActivity.ActivityType? {
        get {
            return UIActivity.ActivityType("flag")
        }
    }
    
    override var activityImage: UIImage? {
        get {
            return UIImage(named: "flag")
        }
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func perform() {
        controller.performSegue(withIdentifier: "flag", sender: nil)
    }
}
