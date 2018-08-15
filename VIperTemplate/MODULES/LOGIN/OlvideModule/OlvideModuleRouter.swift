//
//  OlvideModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class OlvideModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> OlvideModuleViewController {
        let viewController = OlvideModuleViewController()
        let presenter = OlvideModulePresenter()
        let router = OlvideModuleRouter()
        let interactor = OlvideModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OlvideModuleRouter: OlvideModuleWireframe {
    // TODO: Implement wireframe methods
}
