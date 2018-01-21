import UIKit

extension UIViewController {
    func easyAlert(_ error: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
}
extension APIErrorDelegate where Self: UIViewController  {
    
    func handleAPI(error: String) {
        easyAlert(error)
    }
    
}
