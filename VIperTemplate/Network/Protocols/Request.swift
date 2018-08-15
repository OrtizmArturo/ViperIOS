//
//  TargetType.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/2/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation

protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: Method { get }
    var params: [String:AnyObject]? { get }
    var headers: [String:String]? { get }
}

