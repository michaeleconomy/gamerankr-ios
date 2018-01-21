import UIKit
import Apollo

extension UIViewController {
    func share(message: String, link: String, displayFlag: Bool = false) {
        if let link = NSURL(string: link) {
            let objectsToShare = [message, link] as [Any]
            var applicationActivities: [UIActivity]? = nil
            if (displayFlag) {
                applicationActivities = [FlagActivity(controller: self)]
            }
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: applicationActivities)
            activityVC.excludedActivityTypes = [UIActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}
