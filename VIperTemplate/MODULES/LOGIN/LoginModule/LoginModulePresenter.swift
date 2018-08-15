//
//  LoginModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/4/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class LoginModulePresenter {

    // MARK: Properties

    var view: LoginModuleView?
    var router: LoginModuleWireframe?
    var interactor: LoginModuleUseCase?
}

extension LoginModulePresenter: LoginModulePresentation {
    func registro() {
        self.router?.registro()
    }
    
    func olvidePass() {
        self.router?.olvidePass()
    }
    
    func login() {
        UserDefaults.standard.setLoggedIn(value: true)
        self.router?.login()
    }
    
    // TODO: implement presentation methods
}

extension LoginModulePresenter: LoginModuleInteractorOutput {
    // TODO: implement interactor output methods
}
