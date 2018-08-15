//
//  DetailModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class DetailModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> DetailModuleViewController {
        let viewController = DetailModuleViewController()
        let presenter = DetailModulePresenter()
        let router = DetailModuleRouter()
        let interactor = DetailModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension DetailModuleRouter: DetailModuleWireframe {
    func startNavigation() {
        self.view?.navigationController?.popToRootViewController(animated: true)
    }
    
    // TODO: Implement wireframe methods
}
