//
//  URLConstants.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/3/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

enum Ambiente {
    case QA
    case UAT
    case PRO
}

struct URLs {
    
    static let baseURLapi1 = getBaseAmbienteURLapi1(type: .QA)
    static let baseURLapi2 = getBaseAmbienteURLapi2(type: .QA)

    static let consultaMediosElectronicos = "path1/path2"
    static let consultaMediosContacto = "path1/path2?var1={var1}"
    static let login = "path1/path1?var1={var1}"

    struct Keys {
        static let apiKey = "apiKey"
    }
    
    
    
    
    static func getBaseAmbienteURLapi1(type:Ambiente) -> String {
        switch type {
        case .QA:
            return "https://api.com/"
        case .UAT:
            return "https://api.com/"
        case .PRO:
            return "https://api.com/"
        }
    }

    static func getBaseAmbienteURLapi2(type:Ambiente) -> String {
        switch type {
        case .QA:
            return "https://api.com/"
        case .UAT:
            return "https://api.com/"
        case .PRO:
            return "https://api.com/"
        }
    }

}
