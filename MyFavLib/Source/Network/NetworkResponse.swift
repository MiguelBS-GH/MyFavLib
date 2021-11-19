//
//  NetworkResponse.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 19/11/21.
//

import Foundation

enum NetworkResponse<T> {
  case success(T)
  case failure(NetworkError)
}

enum NetworkError {
  case unknown
  case noJSONData
}
