//
//  URLRequest.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 19/11/21.
//

import Foundation

public extension URLRequest {
    init(service: ServiceProtocol) {
        let urlComponents = URLComponents(service: service) // 1
        self.init(url: urlComponents.url!) // 2
        httpMethod = service.method.rawValue // 3
        service.headers?.forEach { key, value in // 4
            addValue(value, forHTTPHeaderField: key)
        }

        guard case let .requestParameters(parameters) = service.task,
              service.parametersEncoding == .json
        else { return } // 5
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
