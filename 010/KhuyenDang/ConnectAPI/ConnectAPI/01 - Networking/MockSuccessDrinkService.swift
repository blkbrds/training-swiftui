//
//  MockSuccessDrinkService.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation

class MockSuccessDrinkService: FakeServer {
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: "drinkjs", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let result = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
            let drinks = result?["drinks"] as? [[String: Any]] ?? []
            let names = drinks.compactMap { $0["strDrink"] as? String }
            completion(names, nil)
        } catch {
            print("Lỗi khi ánh xạ JSON: \(error.localizedDescription)")
        }
    }
}
