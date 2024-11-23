//
//  BaseResponse.swift
//  Irumso
//
//  Created by dezxcvb on 11/19/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: String
    var message: String
    var result: T
}
