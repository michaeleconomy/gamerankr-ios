import UIKit

extension UIViewController {
    func easyAlert(_ error: String) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension APIErrorDelegate where Self: UIViewController  {
    
    func handleAPI(error: String) {
        easyAlert(error)
    }
    
}