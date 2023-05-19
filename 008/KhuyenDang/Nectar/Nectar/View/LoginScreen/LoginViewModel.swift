//
//  LoginViewModel.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginSuccess: Bool = false
    @Published var contentAlert: String = ""
    private var localStorage = LocalStorage()

    func isValidAccount() async {
        do {
            let account = try await DataManager().isValidAccount(email: email, password: password)
            DispatchQueue.main.async {
                guard let account = account else {
                    self.contentAlert = "Invalid username or password"
                    return
                }
                self.isLoginSuccess = true
                self.localStorage.setUser(email: account.email, password: account.password)
            }
        } catch {
            DispatchQueue.main.async {
                self.contentAlert = "We can't connect to server"
            }
        }
    }

    func resetData() {
        email = ""
        password = ""
        isLoginSuccess = false
    }
}
