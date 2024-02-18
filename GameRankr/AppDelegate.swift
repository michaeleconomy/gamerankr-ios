import UIKit
import Kingfisher
import Sentry
import Apollo
import Foundation
import CoreAudioTypes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var universalLinkId: Api.ID?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SentrySDK.start { options in
            options.dsn = "https://21746597ddb44404a91dd3139c513e64@o110652.ingest.sentry.io/6661119"
#if DEBUG
            options.beforeSend = { event in
                // modify event here or return NULL to discard the event
                return nil
            }
#endif

        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([Any]?) -> Void) -> Bool
    {
        NSLog("userActivity: called")
        
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb else {
            NSLog("userActivity: userActivity.activityType: \(userActivity.activityType)")
            return false
        }
        
        guard let incomingURL = userActivity.webpageURL else {
            NSLog("userActivity: incomingURL unspecified")
            return false
        }
        NSLog("userActivity: incomingURL = \(incomingURL)")
        
        guard let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
            NSLog("userActivity: no url components")
            return false
        }


        let path = components.path ?? ""
        NSLog("userActivity: path = \(path)")
        let params = components.queryItems ?? []
        NSLog("userActivity: params = \(params)")
        
        guard let uiTabBarController = window?.rootViewController as? UITabBarController else {
            NSLog("UITabBarController not the root view controller")
            return false
        }
        guard let firstNavigationController = uiTabBarController.viewControllers?[0] as? UINavigationController else {
            NSLog("could not get first tab")
            return false
        }
        let firstController = firstNavigationController.viewControllers[0]
        
        if path == "/" {
            NSLog("/ - Open the app anywhere, it's cool")
            return true
        }
        
        if path.starts(with: "/games/") {
            guard let id = getId(path) else {
                NSLog("could not get id from path")
                return false
            }
            universalLinkId = id
            firstController.performSegue(withIdentifier: "universalGameDetail", sender: self)
            return true
        }
        
        
        if path.starts(with: "/users/") {
            guard let id = getId(path) else {
                NSLog("could not get id from path")
                return false
            }
            universalLinkId = id
            firstController.performSegue(withIdentifier: "universalUserDetail", sender: self)
            return true
        }
        
        return false
    }
    
    private func getId(_ path: String) -> Api.ID? {
        guard let range = path.range(of: #"(\d+)"#, options: .regularExpression) else {
            return nil
        }
        let idRaw = path[range]
        return Api.ID(idRaw)
    }
    
}

