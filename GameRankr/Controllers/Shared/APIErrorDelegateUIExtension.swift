import UIKit
import Sentry

class ErrorLogger {
    class func silentError(_ error: String) {
        NSLog("Error: \(error)")
        SentrySDK.capture(message: error)
    }
}

extension UIViewController {
    func silentError(_ error: String) {
        ErrorLogger.silentError(error)
    }
    
    func unexpectedError(_ userError: String, sentryError: String? = nil) {
        let sentryError = sentryError ?? userError
        silentError(sentryError)
        easyAlert(userError)
    }
    
    func easyAlert(_ error: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
}
extension APIErrorDelegate where Self: UIViewController  {
    
    func handleAPI(error: String) {
        DispatchQueue.main.async {
            self.easyAlert(error)
        }
    }
    
}
