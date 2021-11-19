//
//  NetworkResponse.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 19/11/21.
//

import Foundation

public enum NetworkResponse<T> {
  case success(T)
  case failure(NetworkError)
}

public enum NetworkError {
  case unknown
  case noJSONData
}
