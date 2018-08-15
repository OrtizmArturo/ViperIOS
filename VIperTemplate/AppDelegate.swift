//
//  AppDelegate.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/6/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var presenter: DelegatePresentation?

    func setupDelegate() {
        let presenter = DelegatePresenter()
        let router = DelegateRouter()
        let interactor = DelegateInteractor()
        
        self.presenter =  presenter
        
        presenter.appDelegate = self
        presenter.router = router
        presenter.interactor = interactor
        
        router.appDelegate = self
        
        interactor.output = presenter
    }

//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        let scheme = url.scheme ?? ""
//        let path = url.path
//        let query = url.query ?? ""
//        print(scheme)
//        print(path)
//        print(query)
//        var user : String?
//        var pass : String?
//        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//        if let queryItems = components?.queryItems {
//            for queryItem in queryItems {
//                print("\(queryItem.name): \(queryItem.value)")
//                if queryItem.name == "arg1"{
//                    user = queryItem.value
//                }
//                if queryItem.name == "arg2"{
//                    pass = queryItem.value
//                }
//            }
//        }
//        if user != nil && pass != nil {
//            self.showHome()
//        }
//        return true
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        UINavigationBar.appearance().customizeNavigation()
        UITabBar.appearance().customizeTabs()
        self.setupDelegate()
        window = UIWindow(frame: UIScreen.main.bounds)

        self.presenter?.checkLogin()
        
        //checkLogin(validSession: false)
        
        

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

}

extension AppDelegate: DelegateView {
    // TODO: implement view output methods
}


