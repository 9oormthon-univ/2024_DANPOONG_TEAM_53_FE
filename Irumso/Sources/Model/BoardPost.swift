//
//  BoardPost.swift
//  Irumso
//
//  Created by dezxcvb on 11/21/24.
//

import Foundation

struct BoardPost: Codable {
    var id: Int
    var title: String
    var content: String
    var createdBy: User
    var imageUrl: String
    var likes: Int
    var createdAt: String
    var updatedAt: String
    var authorNickname: String
}
