//
//  HomeRouter.swift
//  Irumso
//
//  Created by dezxcvb on 11/21/24.
//

import Alamofire

enum HomeRouter {
    case getServiceListbyView
    
}

extension HomeRouter: TargetType {
    var baseUrl: String {
        return Constant.baseUrl
    }

    var method: HTTPMethod {
        switch self {
        case .getServiceListbyView:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getServiceListbyView:
            return "/api/rank/view"
        }
    }

    var header: HTTPHeaders {
        return Constant.headers
    }

    var parameter: RequestParams? {
        switch self {
        case .getServiceListbyView:
            return nil
        }
    }

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var body: [String : Any]? {
        switch self {
        case .getServiceListbyView:
            return nil
        }
        
    }
}
