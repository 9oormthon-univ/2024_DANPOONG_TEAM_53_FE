//
//  Constant.swift
//  Irumso
//
//  Created by dezxcvb on 11/19/24.
//

import Foundation
import Alamofire

struct Constant {
    static var baseUrl: String {
        #if DEBUG
        return "http://localhost:8080/api"
        #else
        return ""
        #endif
    }
    
    static var headers: HTTPHeaders {
        var headers: HTTPHeaders = [
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader.accept("*/*")
        ]
        
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        }
        
        return headers
        }
}
