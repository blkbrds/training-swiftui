//
//  API.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/07/2023.
//

import Foundation
import Combine
import RxSwift
import RxCocoa

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
    private let maxRetryCount = 3
    private let disposeBag = DisposeBag()
    struct Path {
        static let drinkUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
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

    func request1<T: Decodable>(_ url: URL, ofType type: T.Type) -> Single<T> {
        return Single.create { single in
            var attempts = 0

            func performRequest() {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        if attempts < self.maxRetryCount {
                            attempts += 1
                            print("Retrying \(attempts)/\(self.maxRetryCount)")
                            performRequest() // Retry
                        } else {
                            single(.error(error))
                        }
                    } else if let data = data {
                        do {
                            let decodedObject = try JSONDecoder().decode(type, from: data)
                            single(.success(decodedObject))
                        } catch {
                            single(.error(APIError.parseError))
                        }
                    }
                }
                task.resume()
            }

            performRequest()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
