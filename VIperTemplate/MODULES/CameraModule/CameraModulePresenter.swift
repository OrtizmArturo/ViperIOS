//
//  CameraModulePresenter.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/12/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class CameraModulePresenter {

    // MARK: Properties

    var view: CameraModuleView?
    var router: CameraModuleWireframe?
    var interactor: CameraModuleUseCase?
}

extension CameraModulePresenter: CameraModulePresentation {
    // TODO: implement presentation methods
}

extension CameraModulePresenter: CameraModuleInteractorOutput {
    // TODO: implement interactor output methods
}
