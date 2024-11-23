//
//  CommentRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire

enum CommentRouter {
    case createComment(nickname: String, postId: Int, content: String, parentCommentId: Int)
    case editComment(commentId: Int, content: String)
    case editRepliy(commentId: Int, content: String)
    case getComments(postId: Int)
    case getReplies(parentCommentId: Int)
    case deleteComment(commentId: Int)
    case deleteRepliy(commentId: Int)
}

extension CommentRouter: TargetType {
    var baseUrl: String {
        return Constant.baseUrl
    }
    
    var method: HTTPMethod {
        switch self {
        case .createComment:
            return .post
        case .editComment:
            return .put
        case .editRepliy:
            return .put
        case .getComments:
            return .get
        case .getReplies:
            return .get
        case .deleteComment:
            return .delete
        case .deleteRepliy:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .createComment:
            return "/api/comments"
        case let .editComment(commentId, _):
            return "/api/comments/\(commentId)"
        case let .editRepliy(commentId, _):
            return "/api/comments/replies/\(commentId)"
        case let .getComments(postId):
            return "/api/comments/post/\(postId)"
        case let .getReplies(parentCommentId):
            return "/api/comments/replies/\(parentCommentId)"
        case let .deleteComment(commentId):
            return "/api/comments/\(commentId)"
        case let .deleteRepliy(commentId):
            return "/api/comments/replies/\(commentId)"
        }
    }
    
    var header: HTTPHeaders {
        return Constant.headers
    }
        
    var parameter: RequestParams? {
        return nil
    }
        
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var body: [String : Any]? {
        switch self {
        case let .createComment(nickname, postId, content, parentCommentId):
            return ["nickname": nickname, "postId": postId, "content": content, "parentCommentId": parentCommentId]
        case let .editComment(_, content):
            return ["content": content]
        case let .editRepliy(_, content):
            return ["content": content]
        case .getComments:
            return nil
        case .getReplies:
            return nil
        case .deleteComment:
            return nil
        case .deleteRepliy:
            return nil
        }
    }
}
