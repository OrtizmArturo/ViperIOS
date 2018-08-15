//
//  RegistroModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class RegistroModulePresenter {

    // MARK: Properties

    var view: RegistroModuleView?
    var router: RegistroModuleWireframe?
    var interactor: RegistroModuleUseCase?
}

extension RegistroModulePresenter: RegistroModulePresentation {
    // TODO: implement presentation methods
}

extension RegistroModulePresenter: RegistroModuleInteractorOutput {
    // TODO: implement interactor output methods
}
