//
//  ApiManager.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation

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
    case decodingFailed(Error)
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
        case .decodingFailed(_):
            return "Failed parsing data"
        case .unknown:
            return "Unknown error"
        }
    }
}

protocol FakeServer {
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void)
    func getDrinks(completion: @escaping APICompletion<[Drink]>)
    func getDrinksWithAsync() async throws -> [Drink]
}

class ApiManager: FakeServer {
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else {
            completion(nil, "Error: URL invalid")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: invalid HTTP response code")
                return
            }
            guard let data = data else {
                completion(nil, "Error: response invalid")
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                let drinks = result?["drinks"] as? [[String: Any]] ?? []
                let names = drinks.compactMap { $0["strDrink"] as? String }
                completion(names, nil)
                return
            } catch {
                completion(nil, "JSON decoding error: \(error.localizedDescription)")
            }
        }
            .resume()
    }

    func getDrinks(completion: @escaping APICompletion<[Drink]>) {

        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else {
            completion(.failure(.invalidURL))
            return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Cocktail.self, from: data)
                completion(.success(result.drinks))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
            .resume()
    }
    
    func getDrinksWithAsync() async throws -> [Drink] {
        guard let url =  URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else {
            throw APIError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        let result = try JSONDecoder().decode(Cocktail.self, from: data)
        return result.drinks
    }
}
