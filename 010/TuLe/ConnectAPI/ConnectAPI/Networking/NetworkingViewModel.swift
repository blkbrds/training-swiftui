//
//  NetworkingViewModel.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 26/06/2023.
//

import Foundation
import SwiftUI

enum APIResult<Value> {
    case success(Value)
    case failure(Error)
}

class NetworkingViewModel: ObservableObject {
    @Published var data: Drinks = Drinks(drinks: [])
    private var dogService: GetCocktail
    
    init(getApi: GetCocktail = GetApiCocktailManager()) {
        self.dogService = getApi
    }
    
    func callApi(urlString: String) {
        dogService.GetCocktails(with: urlString) { [unowned self] result in
            switch result {
            case .success(let value):
                data = value
            case .failure(let error):
                print(error)
            }
        }
    }
}

protocol GetCocktail {
    func GetCocktails(with urlString: String, completion: @escaping (APIResult<Drinks>) -> Void)
}

class GetApiCocktailManager: GetCocktail {
    func GetCocktails(with urlString: String, completion: @escaping (APIResult<Drinks>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session: URLSession = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "com.example", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Drinks.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct Drinks: Codable {
    let drinks: [Ingredient]
    
    enum CodingKeys: CodingKey {
        case drinks
    }
}

struct Ingredient: Codable, Hashable {
    let ingredient: String
    
    enum CodingKeys: String, CodingKey {
        case ingredient = "strIngredient1"
    }
}
