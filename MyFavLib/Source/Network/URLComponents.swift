//
//  URLComponents.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 18/11/21.
//

import Foundation

public extension URLComponents {

    public init(service: ServiceProtocol) {
        let url = service.baseURL.appendingPathComponent(service.path) // 1
        self.init(url: url, resolvingAgainstBaseURL: false)! // 2
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return } // 3
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
