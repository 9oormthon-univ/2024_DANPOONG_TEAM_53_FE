//
//  ExampleService.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Foundation
import Alamofire
// Domain Model == Decodable 로 통일
final class ExampleService {
    static func getExamples(completion: @escaping (AddExampleRequest) -> Void) {
        AF.request(ExampleRouter.getExamples)
//            .responseString
//            .responseData
            .responseDecodable(of: AddExampleRequest.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
}
// Usage

//ExampleService.getExamples { response in
//    print("a")
//}
