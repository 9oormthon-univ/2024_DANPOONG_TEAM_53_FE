//
//  PostService.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire
import Foundation

final class PostService {
    static func createPost(postId: Int, title: String, content: String, image: Data, completion: @escaping (BaseResponse<AdditionalProp>) -> Void) {
        AF.request(PostRouter.createPost(title: title, content: content, image: image))
            .responseDecodable(of: BaseResponse<AdditionalProp>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    // FIXME: Response (AdditionalProp)
    static func upPostView(postId: Int, completion: @escaping (BaseResponse<AdditionalProp>) -> Void) {
        AF.request(PostRouter.upPostView(postId: postId))
            .responseDecodable(of: BaseResponse<AdditionalProp>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func likePost(postId: Int) {
        AF.request(PostRouter.likePost(postId: postId))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    static func searchPost(keyword: String, completion: @escaping (BaseResponse<[BoardPost]>) -> Void) {
        AF.request(PostRouter.searchPost(keyword: keyword))
            .responseDecodable(of: BaseResponse<[BoardPost]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func getListByTopViews(completion: @escaping (BaseResponse<[BoardPost]>) -> Void) {
        AF.request(PostRouter.getListbyTopViews)
            .responseDecodable(of: BaseResponse<[BoardPost]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func getListByTopLikes(completion: @escaping (BaseResponse<[BoardPost]>) -> Void) {
        AF.request(PostRouter.getListbyTopLikes)
            .responseDecodable(of: BaseResponse<[BoardPost]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func updatePost(postId: Int, title: String, content: String, image: Data, completion: @escaping (BaseResponse<AdditionalProp>) -> Void) {
        AF.request(PostRouter.updatePost(postId: postId, title: title, content: content, image: image))
            .responseDecodable(of: BaseResponse<AdditionalProp>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func deletePost(postId: Int) {
        AF.request(PostRouter.deletePost(postId: postId))
            .response { response in
                switch response.result {
                case let .success(response):
                    print("Success: \(String(describing: response))")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    static func likeDelete(postId: Int) {
        AF.request(PostRouter.deleteLike(postId: postId))
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
