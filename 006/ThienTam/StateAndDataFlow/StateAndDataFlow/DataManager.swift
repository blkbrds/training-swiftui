//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 15/06/2023.
//

import Foundation

class Account {
    let userName: String
    let password: String
    let userId: String?

    init(userName: String, password: String, userId: String?) {
        self.userName = userName
        self.password = password
        self.userId = userId
    }
}

class DataManager {

    private var accounts: [Account] = [
        Account(userName: "user1", password: "password1", userId: "12345"),
        Account(userName: "user2", password: "password2", userId: "233443"),
        Account(userName: "user3", password: "password3", userId: "32112212"),
        Account(userName: "user1", password: "password1", userId: nil),
    ]

    func checkLogin(userName: String, password: String) async throws -> Account? {
        do {
            try await Task.sleep(nanoseconds: 2 * 1000000000)
            for account in accounts where account.userName == userName && account.password == password {
                return account
            }
            return nil
        } catch {
            throw error
        }
    }
}
