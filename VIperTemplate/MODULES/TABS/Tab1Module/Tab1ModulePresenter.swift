//
//  Tab1ModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class Tab1ModulePresenter {

    // MARK: Properties

    var view: Tab1ModuleView?
    var router: Tab1ModuleWireframe?
    var interactor: Tab1ModuleUseCase?
}

extension Tab1ModulePresenter: Tab1ModulePresentation {
    func navigate() {
        self.router?.navigate()
    }
    
    // TODO: implement presentation methods
}

extension Tab1ModulePresenter: Tab1ModuleInteractorOutput {
    // TODO: implement interactor output methods
}
