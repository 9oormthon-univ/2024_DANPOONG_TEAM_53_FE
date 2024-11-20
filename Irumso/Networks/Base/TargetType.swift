//
//  TargetType.swift
//  Irumso
//
//  Created by dezxcvb on 11/19/24.
//

import Foundation
import Alamofire

protocol TargetType: URLRequestConvertible {
    var baseUrl: String { get }
    var method: HTTPMethod { get }
    var parameter: RequestParams? { get }
    var encoding: ParameterEncoding { get }
    var header: HTTPHeaders { get }
    var path: String { get }
}

extension TargetType {
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        urlRequest.headers = header
        switch parameter {
        case let .query(request):
            try configQueryParam(for: &urlRequest, with: request)
        case let .body(request):
            try configBodyParam(for: &urlRequest, with: request)
        case .none:
            break
        }
        return urlRequest
    }
    
    private func configQueryParam(for urlRequest: inout URLRequest, with request: Encodable?) throws {
        let params = request?.toDictionary() ?? [:]
        let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard var components = URLComponents(string: urlRequest.url?.absoluteString ?? "") else {
            throw URLError(.badURL)
        }
        components.queryItems = queryParams
        urlRequest.url = components.url
    }
    
    private func configBodyParam(for urlRequest: inout URLRequest, with request: Encodable?) throws {
        let params = request?.toDictionary() ?? [:]
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
    }
}

enum RequestParams {
    case query(_ parameter: Encodable?)
    case body(_ parameter: Encodable?)
}
