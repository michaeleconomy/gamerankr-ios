import Foundation
import UIKit

extension UIViewController {
    func openUrl(_ string: String) {
        guard let url = URL(string: string) else {
            unexpectedError("coudln't make a url out of: \(string)")
            return
        }
        
        UIApplication.shared.open(url) {
            boolean in
            if (!boolean) {
                DispatchQueue.main.async {
                    self.silentError("could not open the url for some reason!")
                }
            }
        }
    }
}


