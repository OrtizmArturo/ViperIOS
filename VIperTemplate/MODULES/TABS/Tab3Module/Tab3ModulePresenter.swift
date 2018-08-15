//
//  Tab3ModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class Tab3ModulePresenter {

    // MARK: Properties

    var view: Tab3ModuleView?
    var router: Tab3ModuleWireframe?
    var interactor: Tab3ModuleUseCase?
}

extension Tab3ModulePresenter: Tab3ModulePresentation {
    func openCamera() {
        self.router?.navigateCamera()
    }
    
    func logout() {
        UserDefaults.standard.setLoggedIn(value: false)
        self.router?.logout()
    }
    
    // TODO: implement presentation methods
}

extension Tab3ModulePresenter: Tab3ModuleInteractorOutput {
    // TODO: implement interactor output methods
}
