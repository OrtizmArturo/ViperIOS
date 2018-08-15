//
//  OutDetailModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class OutDetailModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> OutDetailModuleViewController {
        let viewController = OutDetailModuleViewController()
        let presenter = OutDetailModulePresenter()
        let router = OutDetailModuleRouter()
        let interactor = OutDetailModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OutDetailModuleRouter: OutDetailModuleWireframe {
    func popNavigation() {
        self.view?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // TODO: Implement wireframe methods
}
