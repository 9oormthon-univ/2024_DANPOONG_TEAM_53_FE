//
//  User.swift
//  Irumso
//
//  Created by dezxcvb on 11/21/24.
//

import Foundation

//struct User: Codable {
//    var id: Int
//    var username: String
//    var password: String
// MARK: FIXME
//    var surveyRecommendationId: Int?
//}

//struct User: Codable {
//    let id: Int
//    let nickname: String
//    let refreshToken: RefreshToken
//    let password: String
//    let enabled: Bool
//    let authorities: [Authority]
//    let username: String
//    let accountNonExpired: Bool
//    let accountNonLocked: Bool
// MARK: FIXME
//    let credentialsNonExpired: Bool
//}

struct User: Codable {
    var id: Int
    var nickname: String
    var refreshToken: RefreshToken
    var password: String
    var enabled: Bool
    var authorities: [Authority]
    var username: String
    var credentialsNonExpired: Bool
    var accountNonExpired: Bool
    var accountNonLocked: Bool
}

struct Authority: Codable {
    let authority: String
}
