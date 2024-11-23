//
//  PostRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire
import Foundation

enum PostRouter {
    case createPost(title: String, content: String, image: Data)
    case upPostView(postId: Int)
    case likePost(postId: Int)
    case searchPost(keyword: String)
    case getListbyTopViews
    case getListbyTopLikes
    case updatePost(postId: Int, title: String, content: String, image: Data)
    case deletePost(postId: Int)
    case deleteLike(postId: Int)
}

extension PostRouter: TargetType {
    var baseUrl: String {
        return Constant.baseUrl
    }

    var method: HTTPMethod {
        switch self {
        case .createPost:
            return .post
        case .upPostView:
            return .post
        case .likePost:
            return .post
        case .searchPost:
            return .get
        case .getListbyTopViews:
            return .get
        case .getListbyTopLikes:
            return .get
        case .updatePost:
            return .put
        case .deletePost:
            return .delete
        case .deleteLike:
            return .delete
        }
    }

    var path: String {
        switch self {
        case .createPost:
            return "/api/posts"
        case let .upPostView(postId):
            return "/api/posts/\(postId)/view"
        case let .likePost(postId):
            return "/api/posts/\(postId)/like"
        case .searchPost:
            return "api/posts/search"
        case .getListbyTopViews:
            return "/api/posts/top-views"
        case .getListbyTopLikes:
            return "/api/posts/top-likes"
        case let .updatePost(postId, _, _, _):
            return "/api/posts/\(postId)"
        case let .deletePost(postId):
            return "/api/posts/\(postId)"
        case let .deleteLike(postId):
            return "/api/posts/\(postId)/like"
        }
    }

    var header: HTTPHeaders {
        return Constant.headers
    }

    var parameter: RequestParams? {
        switch self {
        case let .createPost(title, content, _):
            return .query(["title": title, "content": content])
        case .upPostView:
            return nil
        case .likePost:
            return nil
        case let .searchPost(keyword: keyword):
            return .query(["keyword": keyword])
        case .getListbyTopViews:
            return nil
        case .getListbyTopLikes:
            return nil
        case let .updatePost(_, title, content, _):
            return .query(["title": title, "content": content])
        case .deletePost:
            return nil
        case .deleteLike:
            return nil
        }
    }

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var body: [String : Any]? {
        switch self {
        case let .createPost(_, _, image):
            return ["image": image]
        case .upPostView:
            return nil
        case .likePost:
            return nil
        case .searchPost:
            return nil
        case .getListbyTopViews:
            return nil
        case .getListbyTopLikes:
            return nil
        case let .updatePost(_, _, _, image):
            return ["image": image]
        case .deletePost:
            return nil
        case .deleteLike:
            return nil
        }
        
    }
}

