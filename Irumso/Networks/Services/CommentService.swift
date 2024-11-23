//
//  CommentService.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire

final class CommentService {
    static func createComment(nickname: String, postId: Int, content: String, parentCommentId: Int) {
        AF.request(CommentRouter.createComment(nickname: nickname, postId: postId, content: content, parentCommentId: parentCommentId))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    static func editComment(commentId: Int, content: String) {
        AF.request(CommentRouter.editComment(commentId: commentId, content: content))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    static func editRepliy(commentId: Int, content: String) {
        AF.request(CommentRouter.editRepliy(commentId: commentId, content: content))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    static func getComments(postId: Int, completion: @escaping (BaseResponse<[BoardComment]>) -> Void) {
        AF.request(CommentRouter.getComments(postId: postId))
            .responseDecodable(of: BaseResponse<[BoardComment]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func getReplies(parentCommentId: Int, completion: @escaping (BaseResponse<[BoardComment]>) -> Void) {
        AF.request(CommentRouter.getReplies(parentCommentId: parentCommentId))
            .responseDecodable(of: BaseResponse<[BoardComment]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func deleteComment(commentId: Int) {
        AF.request(CommentRouter.deleteComment(commentId: commentId))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    static func deleteRepliy(commentId: Int) {
        AF.request(CommentRouter.deleteRepliy(commentId: commentId))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}
