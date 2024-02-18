import UIKit

class GameRankrUITabBarController: UITabBarController, APIAuthenticationDelegate {
    
    var signInController: SignUpViewController?
    var settingsController: SettingsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.register(authenticationDelegate: self)
        showHideLogout()
    }
    
    func handleAPILogin() {
        asyncShowHideLogout()
    }
    
    func handleAPILogout() {
        asyncShowHideLogout()
    }
    
    private func asyncShowHideLogout() {
        DispatchQueue.main.async {
            self.showHideLogout()
        }
    }
    
    private func showHideLogout() {
        if (api.signedIn) {
            removeSignInPage()
            addPage(settingsController)
            return
        }
        
        removeSettingsPage()
        addPage(signInController)
    }
    
    private func removeSignInPage() {
        let signInIndex = viewControllers!.index(where: {controller in
            return (controller as? SignUpViewController) != nil
        })
        
        if (signInIndex == nil) {
            NSLog("sign in page not found")
            return
        }
        self.signInController = viewControllers!.remove(at: signInIndex!) as? SignUpViewController
    }
    
    private func removeSettingsPage() {
        let settingsIndex = viewControllers?.index(where: {controller in
            return (controller as? SettingsController) != nil
        })
        
        guard let settingsIndex = settingsIndex else {
            NSLog("settings page not found")
            return
        }
        settingsController = viewControllers?.remove(at: settingsIndex) as? SettingsController
    }
    
    private func addPage(_ page: UIViewController?) {
        if (page != nil) {
            if (!viewControllers!.contains(page!)) {
                NSLog("adding controller: \(String(describing: page))")
                viewControllers!.append(page!)
            }
        }
    }
}
