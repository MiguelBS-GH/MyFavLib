//
//  Request.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 18/11/21.
//

import Foundation

protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias ProgressHandler = (Float) -> Void

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}

typealias Headers = [String: String]

enum ParametersEncoding {
    case url
    case json
}
