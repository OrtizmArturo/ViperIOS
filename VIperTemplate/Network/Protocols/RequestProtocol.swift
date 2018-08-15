//
//  RequestProtocol.swift
//  ajuste
//
//  Created by Arturo Ortiz on 6/29/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

public protocol RequestProtocol{
    associatedtype MethodEnum
    
    static func httpRequest(endPoint:MyApiRequest, completion: @escaping (_ success:Bool, _ result: AnyObject? ) -> Void)
    
}
