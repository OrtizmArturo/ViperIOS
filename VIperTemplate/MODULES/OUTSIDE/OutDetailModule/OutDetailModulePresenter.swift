//
//  OutDetailModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class OutDetailModulePresenter {

    // MARK: Properties

    var view: OutDetailModuleView?
    var router: OutDetailModuleWireframe?
    var interactor: OutDetailModuleUseCase?
}

extension OutDetailModulePresenter: OutDetailModulePresentation {
    func popNavigation() {
        self.router?.popNavigation()
    }
    
    // TODO: implement presentation methods
}

extension OutDetailModulePresenter: OutDetailModuleInteractorOutput {
    // TODO: implement interactor output methods
}
