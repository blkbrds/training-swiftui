//
//  MockFailureDrinkService.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/06/2023.
//

import Foundation

class MockFailureDrinkService: FakeServer {
    var shouldFail: Bool = false
    func getDrinks(completion: @escaping APICompletion<[Drink]>) {
        if shouldFail {
            let error = APIError.invalidResponse
            completion(.failure(error))
        }
    }
}
