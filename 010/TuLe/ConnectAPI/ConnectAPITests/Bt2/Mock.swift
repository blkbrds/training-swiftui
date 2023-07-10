//
//  Mock.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 29/06/2023.
//

import Foundation
@testable import ConnectAPI

class Mock: GetCocktailGlass{
    func GetCocktails(with urlString: String, completion: @escaping (ConnectAPI.APIResult<ConnectAPI.CocktailGlass>) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return
        }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let persons = try decoder.decode(CocktailGlass.self, from: jsonData)
            completion(.success(persons))
        } catch {
            // Xử lý lỗi khi ánh xạ JSON
            completion(.success(CocktailGlass(cocktail: [])))
        }
    }
}

class MockFailure: GetCocktailGlass {

    var shouldFail: Bool = false
    
    func GetCocktails(with urlString: String, completion: @escaping (ConnectAPI.APIResult<ConnectAPI.CocktailGlass>) -> Void) {
        if shouldFail {
            completion(.failure(NSError(domain: "", code: 400)))
        }
    }

}
