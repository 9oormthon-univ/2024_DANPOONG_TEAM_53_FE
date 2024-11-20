//
//  ExampleRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Alamofire

enum ExampleRouter {
    case getExamples
    case addExample(AddExampleRequest)
}

extension ExampleRouter: TargetType {
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
//        case let .deleteExample(request):
//            return "/examples/\(request.exampleId)"
        }
    }

    var header: HTTPHeaders {
        return Constant.header
    }

    var parameter: RequestParams? {
        switch self {
        case .getExamples:
            return nil
        case let .addExample(request):
            return .body(request)
//        case .deleteExample:
//            return nil
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getExamples:
            return URLEncoding.default
        case .addExample/*, .deleteExample*/:
            return JSONEncoding.default
        }
    }
}
