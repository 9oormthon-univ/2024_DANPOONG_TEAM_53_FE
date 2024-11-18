//
//  Model.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Foundation

struct OAuth: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Member
}

struct Member: Codable {
    var userId: Int
    var accessToken: String
}

