//
//  RequestBuilder.swift
//  ajuste
//
//  Created by Arturo Ortiz on 6/29/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import Alamofire

enum Method {
    case GET
    case POST
    case PUT
    case DELETE
}

struct RequestBuilder: RequestProtocol {
    typealias MethodEnum = Method

    static func httpRequest(endPoint: MyApiRequest, completion: @escaping (Bool, AnyObject?) -> Void) {
        let fullURL = "\(endPoint.baseURL)\(endPoint.path)"
        var type = HTTPMethod.get
        switch endPoint.httpMethod {
        case .GET:
            type = .get
        case .POST:
            type = .post
        case .PUT:
            type = .put
        case .DELETE:
            type = .delete
        }
        Alamofire.request(fullURL, method: type, parameters: endPoint.params, encoding: JSONEncoding.default, headers: endPoint.headers).responseString { (response:DataResponse<String>) in
            switch(response.result) {
            case .success(_):
                if (response.result.value) != nil {
                    let json = response.result.value as AnyObject
                    completion(true, json)
                }else{
                    completion(true, nil)
                }
                break
            case .failure(_):
                let message : String
                if (response.response?.statusCode) != nil {
                    message = "Error: \(response.response?.statusCode ?? 0)"
                    completion(false, message as AnyObject)
                } else {
                    message = (response.result.error?.localizedDescription)!
                    completion(false, message as AnyObject)
                }
                break
            }
        }

    }
    
}
