//
//  DetailModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class DetailModulePresenter {

    // MARK: Properties

    var view: DetailModuleView?
    var router: DetailModuleWireframe?
    var interactor: DetailModuleUseCase?
}

extension DetailModulePresenter: DetailModulePresentation {
    func startNavigation() {
        self.router?.startNavigation()
    }
    
    // TODO: implement presentation methods
}

extension DetailModulePresenter: DetailModuleInteractorOutput {
    // TODO: implement interactor output methods
}
