//
//  MockFailureDogService.swift
//  ConnectAPI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/06/2023.
//

import Foundation

class MockFailureDogService: GetDog {

    var shouldFail: Bool = false

    func getDogs(completion: @escaping APICompletion<[Animal]>) {
        if shouldFail {
            let error = APIError.invalidResponse
            completion(.failure(error))
        }
    }
}
