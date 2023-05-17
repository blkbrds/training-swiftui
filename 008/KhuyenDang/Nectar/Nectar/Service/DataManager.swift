//
//  DataManager.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import Foundation
import SwiftUI

class DataManager: ObservableObject {

    var accounts = [
        Account(email: "khuyen@gmail.com", password: "123"),
        Account(email: "aaa@gmail.com", password: "123")
    ]

    func isValidAccount(email: String, password: String) async throws -> Account? {
        do {
            try await Task.sleep(nanoseconds: 2 * 1000000000)
            for account in accounts {
                if account.email == email && account.password == password {
                    return account
                }
            }
            return nil
        } catch {
            throw error
        }
    }
}
