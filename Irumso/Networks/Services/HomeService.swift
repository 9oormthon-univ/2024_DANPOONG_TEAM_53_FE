//
//  HomeService.swift
//  Irumso
//
//  Created by dezxcvb on 11/21/24.
//

import Alamofire

final class HomeService {
    static func getServiceListbyView(completion: @escaping (BaseResponse<[Service]>) -> Void) {
        AF.request(HomeRouter.getServiceListbyView)
            .responseDecodable(of: BaseResponse<[Service]>.self) { response in
                switch response.result {
                case let .success(response):
                    completion(response)
                case let .failure(error):
                    print(error)
                }
            }
    }
}
