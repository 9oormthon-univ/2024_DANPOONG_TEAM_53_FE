//
//  BoardComment.swift
//  Irumso
//
//  Created by dezxcvb on 11/21/24.
//

import Foundation

struct BoardComment: Codable {
    var id: Int
    var boardPost: BoardPost
    var createdBy: User
    var content: String
    var createdAt: String
    var updatedAt: String
    var replies: [String]
    var parentComment: String
}
