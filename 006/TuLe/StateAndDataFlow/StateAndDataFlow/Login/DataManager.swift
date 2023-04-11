//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 10/04/2023.
//

import Foundation

class DataManager: ObservableObject {
    private var loginAccounts: [User] = [
        User(email: "lecongtu123@gmail.com", password: "123456"),
        User(email: "lecongtu456@gmail.com", password: "123456"),
        User(email: "lecongtu789@gmail.com", password: "123456")
    ]
    
    func loadData(value: User) async throws -> Bool {
        try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        let result = await checkUser(value: value)
        return result
    }
    
    func checkUser(value: User) async -> Bool {
        for account in loginAccounts {
            if value == account {
                return true
            }
        }
        return false
    }
}

struct User {
    var email: String
    var password: String
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return
            lhs.email == rhs.email &&
            lhs.password == rhs.password
    }
}
