import UIKit

protocol AlertAPIErrorDelegate : APIErrorDelegate {}

extension AlertAPIErrorDelegate where Self: UIViewController  {
    
    func handleApi(error: String) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
