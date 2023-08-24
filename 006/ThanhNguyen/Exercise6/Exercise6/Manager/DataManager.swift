//
//  DataManager.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import Foundation

final class DataManager: ObservableObject {
    private let localAccounts: [Account] = [
        .init(id: 0, email: "nxthanh18@gmail.com", password: "Abcd@123", address: "Quangnam", nickname: "Thanhx18"),
        .init(id: 1, email: "nxthanh18vn@gmail.com", password: "Abcd@123", address: "Quangnam", nickname: "Thanhx18"),
        .init(id: 2, email: "nxthanh18cn@gmail.com", password: "Abcd@123", address: "Quangnam", nickname: "Thanhx18"),
        .init(id: 3, email: "nxthanh18jp@gmail.com", password: "Abcd@123", address: "Quangnam", nickname: "Thanhx18"),
        .init(id: 4, email: "nxthanh18sg@gmail.com", password: "Abcd@123", address: "Quangnam", nickname: "Thanhx18")
    ]

    func validateAccount(account: Account) async throws -> Account? {
        do {
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            for acc in localAccounts {
                if acc.email == account.email
                    && acc.password == account.password {
                    return acc
                }
            }
            return nil
        } catch {
            throw error
        }
    }
}
