//
//  MockFailureDrinkService.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation

class MockFailureDrinkService: FakeServer {
    var shouldFail: Bool = false
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void) {
        if shouldFail {
            completion(nil, "Fail in process get data")
        }
    }
}
