//
//  MockDogService.swift
//  ConnectAPITests
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/06/2023.
//

import Foundation

class MockDogService: GetDog {
    func getDogs(completion: @escaping APICompletion<[Animal]>) {
        guard let fileURL = Bundle.main.url(forResource: "dogjs", withExtension: "json") else {
            return
        }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let persons = try decoder.decode([Animal].self, from: jsonData)
            completion(.success(persons))
        } catch {
            // Xử lý lỗi khi ánh xạ JSON
            print("Lỗi khi ánh xạ JSON: \(error.localizedDescription)")
        }

    }
}
