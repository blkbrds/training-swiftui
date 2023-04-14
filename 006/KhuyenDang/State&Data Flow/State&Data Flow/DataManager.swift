//
//  DataManager.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import Foundation
import SwiftUI

class Account: ObservableObject {

    @Published var username: String?
    @Published var password: String?
    @Published var fullname: String?
    @Published var age: Int?
    @Published var address: String?

    init(username: String? = nil, password: String? = nil, fullname: String? = nil, age: Int? = nil, address: String? = nil) {
        self.username = username
        self.password = password
        self.fullname = fullname
        self.age = age
        self.address = address
    }

    func setUser(fullname: String, age: Int, address: String) {
        self.fullname = fullname
        self.age = age
        self.address = address
    }
}

class DataManager: ObservableObject {

    @Published var account: Account?

    var accounts = [
        Account(username: "a", password: "a", fullname: "Đặng Thị Tú Khuyên", age: 18, address: "Quảng Ngãi"),
        Account(username: "user2", password: "password2", fullname: "Đặng Thị Tú Uyên", age: 20, address: "Quảng Nam"),
        Account(username: "user3", password: "password3", fullname: "Đặng Thị Khuyên", age: 22, address: "Quảng Bình")
    ]

    func isValidAccount(username: String, password: String) async throws -> Bool {
        do {
            for account in accounts {
                if account.username == username && account.password == password {
                    DispatchQueue.main.async {
                        self.account = account
                    }
                    break
                }
            }
            try await Task.sleep(nanoseconds: 2 * 1000000000)
        } catch {
            throw error
        }
        return account != nil
    }
}
