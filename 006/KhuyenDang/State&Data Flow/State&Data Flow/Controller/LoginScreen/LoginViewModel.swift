//
//  LoginViewModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoginSuccess: Bool = false
    @Published var isShowErrorAlert: Bool = false
    @Published var contentAlert: (String, String) = ("", "")
    private var localStorage = LocalStorage()
    @AppStorage("isSaveData") var isSaveData: Bool = false
    var account: Account?

    func getData() {
        guard isSaveData else { return }
        username = localStorage.username
        password = localStorage.password
    }

    func saveData(account: Account) {
        guard let accountLogin = self.account else { return }
        account.updateUser(fullname: accountLogin.fullname ?? "", age: accountLogin.age ?? 0, address: accountLogin.address ?? "")
    }

    func isValidAccount() async {
        do {
            let account = try await DataManager().isValidAccount(username: username, password: password)
            DispatchQueue.main.async {
                guard let account = account else {
                    self.contentAlert = ("Login Failed", "Invalid username or password")
                    self.isShowErrorAlert = true
                    return
                }
                self.isLoginSuccess = true
                self.account = account

                self.localStorage.setUser(username: account.username ?? "", password: account.password ?? "", fullname: account.fullname ?? "", age: account.age ?? 0, address: account.address ?? "")
            }
        } catch {
            DispatchQueue.main.async {
                self.contentAlert = ("Request Failed", "We can't connect to server")
                self.isShowErrorAlert = true
            }
        }
    }

    func resetData() {
        username = ""
        password = ""
        isLoginSuccess = false
    }
}
