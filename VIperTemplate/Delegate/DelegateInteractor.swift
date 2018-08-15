//
//  DelegateInteractor.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

class DelegateInteractor {

    // MARK: Properties

    weak var output: DelegateInteractorOutput?
}

extension DelegateInteractor: DelegateUseCase {
    func activeSession() {
        let logStatus = UserDefaults.standard.isLoggedIn()
        output?.sessionStatus(status: logStatus)
    }
    // TODO: Implement use case methods
}
