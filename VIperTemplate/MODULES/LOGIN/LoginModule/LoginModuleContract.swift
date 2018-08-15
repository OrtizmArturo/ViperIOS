//
//  LoginModuleContract.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/4/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

protocol LoginModuleView {
    // TODO: Declare view methods
}

protocol LoginModulePresentation: class {
    // TODO: Declare presentation methods
    func login()
    func registro()
    func olvidePass()
}

protocol LoginModuleUseCase: class {
    // TODO: Declare use case methods
}

protocol LoginModuleInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol LoginModuleWireframe: class {
    // TODO: Declare wireframe methods
    func login()
    func registro()
    func olvidePass()
}
