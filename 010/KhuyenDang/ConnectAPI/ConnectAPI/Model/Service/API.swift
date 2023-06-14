//
//  API.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/06/2023.
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


class API {
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()
    static func share() -> API {
        return shareAPI
    }
    private init() { }

    struct Path {
        static let drinkUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        static let baseDogUrl = "https://api.thedogapi.com/v1/"
        static let dogUrl = baseDogUrl + "breeds"
        static let detailDogUrl = baseDogUrl + "images/"
        static let baseCatUrl = "https://api.thecatapi.com/v1/"
        static let catUrl = baseCatUrl + "breeds"
        static let detailCatUrl = baseCatUrl + "images/"
    }
}

extension API {

    func request(url: String) -> AnyPublisher<Data, APIError> {
        guard let url = URL(string: url) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            return data
        }
            .mapError { error -> APIError in
            return APIError.requestFailed(error)
        }
            .retry(2)
            .eraseToAnyPublisher()
    }
}
