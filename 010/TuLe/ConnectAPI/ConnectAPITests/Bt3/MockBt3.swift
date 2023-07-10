//
//  MockBt3.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 10/07/2023.
//

import Foundation
@testable import ConnectAPI

class MockBt3: GetAsyncAwait{
    func GetCocktails(with urlString: String) async throws -> CocktailGlass {
        guard let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
            throw NSError(domain: "", code: 0, userInfo: nil)
        }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let persons = try decoder.decode(CocktailGlass.self, from: jsonData)
            return persons
        } catch {
            throw error
        }
    }
}

class Bt3MockFailure: GetAsyncAwait {

    var shouldFail: Bool = false

    func GetCocktails(with urlString: String) async throws -> CocktailGlass {
        if shouldFail {
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
        return CocktailGlass(cocktail: [])
    }
}

/*
 func GetCocktails(with urlString: String) async throws -> CocktailGlass {
     guard let url = URL(string: urlString) else {
         throw NSError(domain: "", code: 0, userInfo: nil)
     }
     do {
         let session: URLSession = URLSession.shared
         let (data, _) = try await session.data(from: url)
         let decoder = JSONDecoder()
         let decodedData = try decoder.decode(CocktailGlass.self, from: data)
         return decodedData
     } catch {
         throw error
     }
 }
 */
