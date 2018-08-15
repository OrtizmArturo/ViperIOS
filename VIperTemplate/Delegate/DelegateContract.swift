//
//  DelegateContract.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

protocol DelegateView {
    // TODO: Declare view methods
}

protocol DelegatePresentation: class {
    // TODO: Declare presentation methods
    func checkLogin()
}

protocol DelegateUseCase: class {
    // TODO: Declare use case methods
    func activeSession()
}

protocol DelegateInteractorOutput: class {
    // TODO: Declare interactor output methods
    func checkActiveSession()
    func sessionStatus(status: Bool)
}

protocol DelegateWireframe: class {
    // TODO: Declare wireframe methods
    func showLogin()
    func showHome()
}
