//
//  TestRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Alamofire

enum TestRouter {
    case getExamples
    case addExample(param1: String, param2: String, image: String)
}

extension TestRouter: TargetType {
    var baseUrl: String {
        return Constant.baseUrl
    }

    var method: HTTPMethod {
        switch self {
        case .getExamples:
            return .get
        case .addExample:
            return .post
        }
    }

    var path: String {
        switch self {
        case .getExamples:
            return "/examples"
        case .addExample:
            return "/examples"
        }
    }

    var header: HTTPHeaders {
        return Constant.headers
    }

    var parameter: RequestParams? {
        switch self {
        case .getExamples:
            return nil
        case let .addExample(param1, param2, _):
            return .query(["title": param1, "content": param2])
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getExamples:
            return URLEncoding.default
        case .addExample:
            return JSONEncoding.default
        }
    }

    var body: [String: Any]? {
        switch self {
        case let .addExample(_, _, image):
            return ["image": image]
        default:
            return nil
        }
    }
}
