//
//  Tab2ModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class Tab2ModulePresenter {

    // MARK: Properties

    var view: Tab2ModuleView?
    var router: Tab2ModuleWireframe?
    var interactor: Tab2ModuleUseCase?
}

extension Tab2ModulePresenter: Tab2ModulePresentation {
    func navigate() {
        self.router?.navigate()
    }
    
    // TODO: implement presentation methods
}

extension Tab2ModulePresenter: Tab2ModuleInteractorOutput {
    // TODO: implement interactor output methods
}
