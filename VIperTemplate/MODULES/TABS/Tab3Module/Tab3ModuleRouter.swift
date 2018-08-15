//
//  Tab3ModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class Tab3ModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> Tab3ModuleViewController {
        let viewController = Tab3ModuleViewController()
        let presenter = Tab3ModulePresenter()
        let router = Tab3ModuleRouter()
        let interactor = Tab3ModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension Tab3ModuleRouter: Tab3ModuleWireframe {
    func navigateCamera() {
        let controller = CameraModuleRouter.setupModule()
        let navController = UINavigationController.init(rootViewController: controller)
        navController.modalTransitionStyle = .crossDissolve
        self.view?.present(navController, animated: true, completion: nil)
    }
    
    func logout() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.presenter?.checkLogin()
    }
    
    // TODO: Implement wireframe methods
}
