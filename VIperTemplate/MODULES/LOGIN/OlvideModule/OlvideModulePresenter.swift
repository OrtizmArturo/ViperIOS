//
//  OlvideModulePresenter.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class OlvideModulePresenter {

    // MARK: Properties

    var view: OlvideModuleView?
    var router: OlvideModuleWireframe?
    var interactor: OlvideModuleUseCase?
}

extension OlvideModulePresenter: OlvideModulePresentation {
    // TODO: implement presentation methods
}

extension OlvideModulePresenter: OlvideModuleInteractorOutput {
    // TODO: implement interactor output methods
}
