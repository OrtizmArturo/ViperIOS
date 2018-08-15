//
//  OutHomeModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class OutHomeModulePresenter {

    // MARK: Properties

    var view: OutHomeModuleView?
    var router: OutHomeModuleWireframe?
    var interactor: OutHomeModuleUseCase?
}

extension OutHomeModulePresenter: OutHomeModulePresentation {
    func navigate() {
        self.router?.navigate()
    }
    
    // TODO: implement presentation methods
}

extension OutHomeModulePresenter: OutHomeModuleInteractorOutput {
    // TODO: implement interactor output methods
}
