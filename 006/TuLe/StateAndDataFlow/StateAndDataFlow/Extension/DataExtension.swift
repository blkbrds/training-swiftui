//
//  DataExtension.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import Foundation

extension Data {
    func loadData() async throws -> User {
        do {
            let decoder = JSONDecoder()
            let userData = try decoder.decode(User.self, from: self)
            return userData
        } catch {
            throw error
        }
    }
}
