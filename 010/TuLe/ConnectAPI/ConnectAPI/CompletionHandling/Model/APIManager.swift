//
//  APIManager.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 29/06/2023.
//

import Foundation

protocol GetCocktailGlass {
    func GetCocktails(with urlString: String, completion: @escaping (APIResult<CocktailGlass>) -> Void)
}

class APIManager: GetCocktailGlass {
    func GetCocktails(with urlString: String, completion: @escaping (APIResult<CocktailGlass>) -> Void) {
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
                let decodedData = try decoder.decode(CocktailGlass.self, from: data)
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
