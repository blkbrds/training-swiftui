//
//  MockSuccessDrinkService.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/06/2023.
//

import Foundation

class MockSuccessDrinkService: FakeServer {
    func getDrinks(completion: @escaping APICompletion<[Drink]>) {
        guard let fileURL = Bundle.main.url(forResource: "drinkjs", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let cocktail = try decoder.decode(Cocktail.self, from: jsonData)
            completion(.success(cocktail.drinks))
        } catch {
            print("Lỗi khi ánh xạ JSON: \(error.localizedDescription)")
        }
    }
}
