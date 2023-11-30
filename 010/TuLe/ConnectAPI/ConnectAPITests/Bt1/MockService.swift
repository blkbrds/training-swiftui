//
//  MockService.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 26/06/2023.
//

import Foundation
@testable import ConnectAPI

class MockService: GetCocktail{
    func GetCocktails(with urlString: String, completion: @escaping (ConnectAPI.APIResult<ConnectAPI.Drinks>) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: "test", withExtension: "json") else {
            return
        }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let persons = try decoder.decode(Drinks.self, from: jsonData)
            completion(.success(persons))
        } catch {
            // Xử lý lỗi khi ánh xạ JSON
            print("Lỗi khi ánh xạ JSON: \(error.localizedDescription)")
        }
    }
}

class MockFailureDogService: GetCocktail {

    var shouldFail: Bool = false
    
    func GetCocktails(with urlString: String, completion: @escaping (ConnectAPI.APIResult<ConnectAPI.Drinks>) -> Void) {
        if shouldFail {
            completion(.failure(NSError(domain: "", code: 400)))
        }
    }

}
