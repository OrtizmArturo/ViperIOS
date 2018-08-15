//
//  CameraModuleRouter.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/12/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class CameraModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> CameraModuleViewController {
        let viewController = CameraModuleViewController()
        let presenter = CameraModulePresenter()
        let router = CameraModuleRouter()
        let interactor = CameraModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CameraModuleRouter: CameraModuleWireframe {
    // TODO: Implement wireframe methods
}
