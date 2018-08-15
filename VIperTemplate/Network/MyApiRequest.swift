//
//  RequestStruct.swift
//  ajuste
//
//  Created by Arturo Ortiz on 6/29/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

public struct MyApiRequest: Request {
    var baseURL: String
    var path: String
    var httpMethod: Method
    var params: [String : AnyObject]?
    var headers: [String : String]?
}

extension MyApiRequest {
    
    static func mediosElectronicos(params: [String : AnyObject]) -> MyApiRequest {
        let header = ["apiKey":URLs.Keys.apiKey] as [String:String]
        return MyApiRequest.init(
            baseURL: URLs.baseURLapi1,
            path: URLs.consultaMediosElectronicos,
            httpMethod: Method.POST,
            params: params,
            headers: header)
    }

    static func consultaMediosElectronicos(idParticipante: String) -> MyApiRequest {
        var pathOK = URLs.consultaMediosContacto
        pathOK = pathOK.replacingOccurrences(of: "{idParticipante}", with: idParticipante)
        let header = ["apiKey":URLs.Keys.apiKey] as [String:String]
        return MyApiRequest.init(
            baseURL: URLs.baseURLapi2,
            path: pathOK,
            httpMethod: Method.GET,
            params: nil,
            headers: header)
    }
    
    static func login(params: [String : AnyObject]) -> MyApiRequest {
        let header = ["apiKey":URLs.Keys.apiKey] as [String:String]
        return MyApiRequest.init(
            baseURL: URLs.baseURLapi1,
            path: URLs.login,
            httpMethod: Method.POST,
            params: params,
            headers: header)
    }
}
