//
//  ApiManager.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 01/06/2023.
//

import Foundation
import Combine

enum TypeAnimal {
    case dog
    case cat
}

protocol FakeServer {
    func getDrinks(completion: @escaping APICompletion<[Drink]>)
}

class ApiManager: FakeServer {
    func getDrinks(completion: @escaping APICompletion<[Drink]>) {

        guard let url = URL(string: API.Path.drinkUrl) else {
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

    static func getDrinksWithAsync() async throws -> [Drink] {
        guard let url = URL(string: API.Path.drinkUrl) else {
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

    static func getDogs(completion: @escaping APICompletion<[Animal]>) {
        API.share().request(url: API.Path.dogUrl)
            .sink(receiveCompletion: { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                break
            }
        }, receiveValue: { data in
                do {
                    let result = try JSONDecoder().decode([Animal].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        )
            .store(in: &cancellables)
    }

    static func getCats(completion: @escaping APICompletion<[Animal]>) {
        API.share().request(url: API.Path.catUrl)
            .sink(receiveCompletion: { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                break
            }
        }, receiveValue: { data in
                do {
                    let result = try JSONDecoder().decode([Animal].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        )
            .store(in: &cancellables)
    }

    static func getDetailAnimal(typeAnimal: TypeAnimal, imageId: String, completion: @escaping APICompletion<DetailAnimal>) {
        let url = typeAnimal == .dog ? API.Path.detailDogUrl : API.Path.detailCatUrl
        API.share().request(url: url + imageId)
            .sink(receiveCompletion: { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                break
            }
        }, receiveValue: { data in
                do {
                    let result = try JSONDecoder().decode(DetailAnimal.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        )
            .store(in: &cancellables)
    }

    static func getPixabay(query: String, completion: @escaping APICompletion<Pixabay>) {
        let url = API.Path.basePixabay + query
        API.share().request(url: url)
            .sink(receiveCompletion: { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                break
            }
        }, receiveValue: { data in
                do {
                    let result = try JSONDecoder().decode(Pixabay.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
        )
            .store(in: &cancellables)
    }
}
private var cancellables = Set<AnyCancellable>()
