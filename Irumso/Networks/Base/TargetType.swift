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
    var body: [String: Any]? { get }
}

extension TargetType {
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        urlRequest.headers = header

        switch parameter {
        case let .query(params):
            try configQueryParam(for: &urlRequest, with: params)
        case let .body(params):
            try configRequestBody(for: &urlRequest, with: params)
        case .none:
            break
        }

        return urlRequest
    }

    private func configQueryParam(for urlRequest: inout URLRequest, with params: [String: Any]?) throws {
        let queryParams = params?.map { URLQueryItem(name: $0.key, value: "\($0.value)") } ?? []

        guard var components = URLComponents(string: urlRequest.url?.absoluteString ?? "") else {
            throw URLError(.badURL)
        }
        components.queryItems = queryParams
        urlRequest.url = components.url
    }

    private func configRequestBody(for urlRequest: inout URLRequest, with params: [String: Any]?) throws {
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params ?? [:], options: [])
    }
}

enum RequestParams {
    case query(_ parameter: [String: Any]?)
    case body(_ parameter: [String: Any]?)

    init<T: Encodable>(query parameter: T?) {
        self = .query(parameter?.toDictionary() ?? [:])
    }

    init<T: Encodable>(body parameter: T?) {
        self = .query(parameter?.toDictionary() ?? [:])
    }
}
