//
//  HomeModuleRouter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class HomeModuleRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> HomeModuleViewController {
        let viewController = HomeModuleViewController()
        let presenter = HomeModulePresenter()
        let router = HomeModuleRouter()
        let interactor = HomeModuleInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension HomeModuleRouter: HomeModuleWireframe {
    func startNavigation() {
        let controller = DetailModuleRouter.setupModule()
        self.view?.navigationItem.title = ""
        self.view?.navigationController?.pushViewController(controller, animated: true)
    }
    
    // TODO: Implement wireframe methods
}
