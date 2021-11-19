//
//  NetworkProvider.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 19/11/21.
//

import Foundation

public protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}

public final class URLSessionProvider: ProviderProtocol { // 1
    private var session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) { // 2
        self.session = session
    }

    public func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable {
        let request = URLRequest(service: service) // 1
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in // 2
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion) // 4
        })
        task.resume() // 3
    }

    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (NetworkResponse<T>) -> ()) {
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData)) }

        switch response.statusCode { // 3
        case 200...299:
            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(.unknown)) } // 4
            completion(.success(model))
        default:
            completion(.failure(.unknown))
        }
    }
}
