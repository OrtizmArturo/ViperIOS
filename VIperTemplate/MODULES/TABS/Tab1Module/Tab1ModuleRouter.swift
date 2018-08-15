//
//  Tab1ModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class Tab1ModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> Tab1ModuleViewController {
        let viewController = Tab1ModuleViewController()
        let presenter = Tab1ModulePresenter()
        let router = Tab1ModuleRouter()
        let interactor = Tab1ModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension Tab1ModuleRouter: Tab1ModuleWireframe {
    func navigate() {
        let controller = HomeModuleRouter.setupModule()
        self.view?.navigationItem.title = ""
        self.view?.navigationController?.pushViewController(controller, animated: true)

//        let controller = HomeModuleRouter.setupModule()
//        let navController = UINavigationController.init(rootViewController: controller)
//        self.view?.present(navController, animated: true, completion: nil)
    }
    
    // TODO: Implement wireframe methods
}
