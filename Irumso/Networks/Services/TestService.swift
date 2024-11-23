//
//  TestService.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Alamofire

final class TestService {
    static func addExample(param1: String, param2: String, image: String, completion: @escaping (BaseResponse<AddExampleRequest>) -> Void) {
        AF.request(TestRouter.addExample(param1: param1, param2: param2, image: image))
//            .responseString
//            .responseData
            .responseDecodable(of: BaseResponse<AddExampleRequest>.self) { response in
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

struct AddExampleRequest: Codable {
    var exampleId: String
}
