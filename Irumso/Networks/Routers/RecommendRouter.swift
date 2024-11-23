//
//  RecommendRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/23/24.
//

import Alamofire

enum RecommendRouter {
    case getRecommendServicelist
    case survey(gender: String, age: Int, job: String, incomeLevel: String)
}

extension RecommendRouter: TargetType {
    var baseUrl: String {
        return Constant.baseUrl
    }
    
    var method: HTTPMethod {
        switch self {
        case .survey:
            return .post
        case .getRecommendServicelist:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .survey:
            return "/api/recommend/survey"
        case .getRecommendServicelist:
            return "/api/recommend"
        }
    }
    
    var header: HTTPHeaders {
        return Constant.headers
    }
    
    var parameter: RequestParams? {
        switch self {
        case let .survey(gender, age, job, incomeLevel):
            return .query(["gender": gender, "age": age, "job": job, "incomeLevel": incomeLevel])
        case .getRecommendServicelist:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var body: [String : Any]? {
        switch self {
        case .survey:
            return nil
        case .getRecommendServicelist:
            return nil
        }
    }
}
