//
//  RecommendService.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire

final class RecommendService {
    static func survey(gender: String, age: Int, job: String, incomeLevel: String, completion: @escaping ((BaseResponse<String>) -> Void)) {
        AF.request(RecommendRouter.survey(gender: gender, age: age, job: job, incomeLevel: incomeLevel))
            .responseDecodable(of: BaseResponse<String>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    static func getRecommendServicelist(completion: @escaping ((BaseResponse<[Recommend]>) -> Void)) {
        AF.request(RecommendRouter.getRecommendServicelist)
            .responseDecodable(of: BaseResponse<[Recommend]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
}
