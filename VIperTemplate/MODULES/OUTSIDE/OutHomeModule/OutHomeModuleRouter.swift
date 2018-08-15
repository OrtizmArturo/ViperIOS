//
//  OutHomeModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class OutHomeModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> OutHomeModuleViewController {
        let viewController = OutHomeModuleViewController()
        let presenter = OutHomeModulePresenter()
        let router = OutHomeModuleRouter()
        let interactor = OutHomeModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OutHomeModuleRouter: OutHomeModuleWireframe {
    func navigate() {
        let controller = OutDetailModuleRouter.setupModule()
        let navController = UINavigationController.init(rootViewController: controller)
        self.view?.present(navController, animated: true, completion: nil)

    }
    
    // TODO: Implement wireframe methods
}
