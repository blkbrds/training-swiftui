//
//  LoginModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/04/2023.
//

import SwiftUI

final class LoginModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var account: Account?

    func isValidAccount(username: String, password: String) async -> Bool {
        DispatchQueue.main.async {
            self.isLoading = true
        }

        do {
            for account in DataManager().accounts {
                if account.username == username && account.password == password {
                    DispatchQueue.main.async {
                        self.account = account
                    }
                    break
                }
            }
            try await Task.sleep(nanoseconds: 2 * 1000000000)
        } catch { }

        DispatchQueue.main.async {
            self.isLoading = false
        }
        return account != nil
    }
}
