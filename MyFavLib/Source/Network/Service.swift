//
//  Request.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 18/11/21.
//

import Foundation

public protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public typealias ProgressHandler = (Float) -> Void

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
}

public typealias Headers = [String: String]

public enum ParametersEncoding {
    case url
    case json
}
