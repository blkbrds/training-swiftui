//
//  API.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/07/2023.
//

import Foundation
import Combine

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]
typealias APICompletion<Value> = (APIResult<Value>) -> Void


enum APIResult<Value> {
    case success(Value)
    case failure(APIError)
}

enum APIError: Error {

    case networkError
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed
    case unknown

    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Error connecting to the server"
        case .invalidURL:
            return "Invalid url path"
        case .requestFailed(let error):
            return "Fail request \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid HTTP response code"
        case .decodingFailed:
            return "Failed parsing data"
        case .unknown:
            return "Unknown error"
        }
    }
}
