import UIKit

class GameRankrUITabBarController: UITabBarController, APIAuthenticationDelegate {
    
    var signInController: SignUpViewController?
    var signOutController: SignOutViewController?
    
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
            addPage(signOutController)
            return
        }
        
        removeSignOutPage()
        addPage(signInController)
    }
    
    private func removeSignInPage() {
        let signInIndex = viewControllers!.index(where: {controller in
            return (controller as? SignUpViewController) != nil
        })
        
        if(signInIndex == nil) {
            return
        }
        self.signInController = viewControllers!.remove(at: signInIndex!) as? SignUpViewController
    }
    
    private func removeSignOutPage() {
        let signOutIndex = viewControllers!.index(where: {controller in
            return (controller as? SignOutViewController) != nil
        })
        
        if(signOutIndex == nil) {
            return
        }
        self.signOutController = viewControllers!.remove(at: signOutIndex!) as? SignOutViewController
    }
    
    private func addPage(_ page: UIViewController?) {
        if (page != nil) {
            if (!viewControllers!.contains(page!)) {
                viewControllers!.append(page!)
            }
        }
    }
}
