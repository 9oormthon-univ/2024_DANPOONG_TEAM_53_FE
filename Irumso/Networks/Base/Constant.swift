//
//  Constant.swift
//  Irumso
//
//  Created by dezxcvb on 11/19/24.
//

import Alamofire

struct Constant {
    static var baseUrl: String {
        #if DEBUG
        return ""
        #else
        return ""
        #endif
    }
    static let header: HTTPHeaders = [HTTPHeader(name: "Content-Type", value: "application/json")]
}
