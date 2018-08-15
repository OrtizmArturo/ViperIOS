//
//  Tab2ModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class Tab2ModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> Tab2ModuleViewController {
        let viewController = Tab2ModuleViewController()
        let presenter = Tab2ModulePresenter()
        let router = Tab2ModuleRouter()
        let interactor = Tab2ModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension Tab2ModuleRouter: Tab2ModuleWireframe {
    func navigate() {
        
        let controller = OutHomeModuleRouter.setupModule()
        let navController = UINavigationController.init(rootViewController: controller)
        self.view?.present(navController, animated: true, completion: nil)
    }
    
    // TODO: Implement wireframe methods
}
