//
//  Recommend.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Foundation

struct Recommend: Codable {
    var id: Int
    var serviceId: String
    var serviceName: String
    var serviceField: String
    var views: Int
    var likes: Int
    var supportContent: String
    var purpose: String
    var applyTarget: String
    var applicationUrl: String
    var youthData: Bool
}
