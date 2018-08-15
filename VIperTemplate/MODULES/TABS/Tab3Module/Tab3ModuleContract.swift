//
//  Tab3ModuleContract.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

protocol Tab3ModuleView {
    // TODO: Declare view methods
}

protocol Tab3ModulePresentation: class {
    // TODO: Declare presentation methods
    func logout()
    func openCamera()
}

protocol Tab3ModuleUseCase: class {
    // TODO: Declare use case methods
}

protocol Tab3ModuleInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol Tab3ModuleWireframe: class {
    // TODO: Declare wireframe methods
    func logout()
    func navigateCamera()

}
