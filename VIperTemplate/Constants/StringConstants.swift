//
//  StringConstants.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/3/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

struct Strings: ConstantsProtocol {
        
    static let alerta       = getPlistString(value: "ALERTA")
    static let aceptar      = getPlistString(value: "ACEPTAR")
    static let cancelar     = getPlistString(value: "CANCELAR")
    static let error        = getPlistString(value: "ERROR")
    static let ok           = getPlistString(value: "OK")

    
    
    static func getPlistString(value: String) -> String {
        let stringsPath = Bundle.main.path(forResource: "Strings", ofType: "plist") ?? ""
        if let stringsPlist = NSDictionary.init(contentsOfFile: stringsPath) {
            let stringFound = stringsPlist[value] as? String ?? "Texto no encontrado"
            return stringFound
        }else{
            return "Texto no encontrado"
        }
    }
    
}
