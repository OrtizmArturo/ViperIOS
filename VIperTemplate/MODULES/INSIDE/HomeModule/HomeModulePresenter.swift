//
//  HomeModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class HomeModulePresenter {

    // MARK: Properties

    var view: HomeModuleView?
    var router: HomeModuleWireframe?
    var interactor: HomeModuleUseCase?
}

extension HomeModulePresenter: HomeModulePresentation {
    func startNavigation() {
        self.router?.startNavigation()
    }
    // TODO: implement presentation methods
}

extension HomeModulePresenter: HomeModuleInteractorOutput {
    // TODO: implement interactor output methods
}
