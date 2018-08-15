//
//  LoginModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/4/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class LoginModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> LoginModuleViewController {
        let viewController = LoginModuleViewController()
        let presenter = LoginModulePresenter()
        let router = LoginModuleRouter()
        let interactor = LoginModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension LoginModuleRouter: LoginModuleWireframe {
    func registro() {
        let controller = RegistroModuleRouter.setupModule()
        let navController = UINavigationController.init(rootViewController: controller)
        self.view?.present(navController, animated: true, completion: nil)
    }
    
    func olvidePass() {
        let controller = OlvideModuleRouter.setupModule()
        let navController = UINavigationController.init(rootViewController: controller)
        self.view?.present(navController, animated: true, completion: nil)
    }
    
    // TODO: Implement wireframe methods
    func login() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.presenter?.checkLogin()
    }
}
