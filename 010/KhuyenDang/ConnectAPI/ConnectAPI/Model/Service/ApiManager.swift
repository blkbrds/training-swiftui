//
//  ApiManager.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation
import Combine

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
                completion(.failure(.decodingFailed))
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
    
    static func fetchDrinks(completion: @escaping APICompletion<[Drink]>) {
        API.share().request(url: API.Path.drinkUrl)
            .sink(receiveCompletion: { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                break
            }
        }, receiveValue: { data in
                do {
                    let result = try JSONDecoder().decode(Cocktail.self, from: data)
                    completion(.success(result.drinks))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        )
            .store(in: &cancellables)
    }
}
private var cancellables = Set<AnyCancellable>()
