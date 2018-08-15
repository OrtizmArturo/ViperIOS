//
//  DelegateRouter.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class DelegateRouter {
    // MARK: Properties
    weak var appDelegate: AppDelegate?
}

extension DelegateRouter: DelegateWireframe {
    func showLogin() {
        UIApplication.shared.statusBarStyle = .lightContent
        let loginModule = LoginModuleRouter.setupModule()
        appDelegate?.window?.rootViewController = loginModule
        appDelegate?.window?.makeKeyAndVisible()
    }
    
    func showHome() {
        UIApplication.shared.statusBarStyle = .lightContent
        let tab1Module = Tab1ModuleRouter.setupModule()
        tab1Module.title = "TAB 1"
        tab1Module.tabBarItem.title = "TAB 1"
        tab1Module.tabBarItem.image = UIImage.init(named: "sIcon.png")
        let tab1NavController = UINavigationController.init(rootViewController: tab1Module)
        
        let tab2Module = Tab2ModuleRouter.setupModule()
        tab2Module.title = "TAB 2"
        tab2Module.tabBarItem.title = "TAB 2"
        tab2Module.tabBarItem.image = UIImage.init(named: "sIcon.png")
        let tab2NavController = UINavigationController.init(rootViewController: tab2Module)
        
        let tab3Module = Tab3ModuleRouter.setupModule()
        tab3Module.title = "TAB 3"
        tab3Module.tabBarItem.title = "TAB 3"
        tab3Module.tabBarItem.image = UIImage.init(named: "sIcon.png")
        let tab3NavController = UINavigationController.init(rootViewController: tab3Module)
        
        let tabs = [tab1NavController, tab2NavController, tab3NavController]
        
        let tabController = TabController.init()
        tabController.setViewControllers(tabs, animated: true)
        tabController.tabBar.shadow = true
        
        appDelegate?.window?.rootViewController = tabController
        appDelegate?.window?.makeKeyAndVisible()
    }
    
    // TODO: Implement wireframe methods
}
