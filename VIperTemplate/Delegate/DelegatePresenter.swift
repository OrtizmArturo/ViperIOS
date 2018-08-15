//
//  DelegatePresenter.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class DelegatePresenter {

    // MARK: Properties

    var appDelegate: DelegateView?
    var router: DelegateWireframe?
    var interactor: DelegateUseCase?
}

extension DelegatePresenter: DelegatePresentation {
    func checkLogin() {
        self.interactor?.activeSession()
    }
    
    // TODO: implement presentation methods
}

extension DelegatePresenter: DelegateInteractorOutput {
    func checkActiveSession() {
        interactor?.activeSession()
    }
    
    func sessionStatus(status: Bool) {
        switch status {
        case true:
            self.router?.showHome()
        case false:
            self.router?.showLogin()
        }
    }
    
    // TODO: implement interactor output methods
}
