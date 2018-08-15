//
//  RegistroModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class RegistroModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> RegistroModuleViewController {
        let viewController = RegistroModuleViewController()
        let presenter = RegistroModulePresenter()
        let router = RegistroModuleRouter()
        let interactor = RegistroModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension RegistroModuleRouter: RegistroModuleWireframe {
    // TODO: Implement wireframe methods
}
