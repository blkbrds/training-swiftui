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

    func checkSaveData() {
        if isSaveData {
            username = localStorage.username
            password = localStorage.password
        }
    }

    func saveData(account: Account) {
        guard let accountLogin = self.account else { return }
        account.updateUser(fullname: accountLogin.fullname ?? "", age: accountLogin.age ?? 0, address: accountLogin.address ?? "")
    }

    func isValidAccount() async {
        await DataManager().isValidAccount(username: username, password: password) { [weak self](account, error) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                if let _ = error {
                    this.contentAlert = ("Request Failed", "We can't connect to server")
                    this.isShowErrorAlert = true
                    return
                } else {
                    guard let account = account else {
                        this.contentAlert = ("Login Failed", "Invalid username or password")
                        this.isShowErrorAlert = true
                        return
                    }
                    this.isLoginSuccess = true
                    this.account = account
                    this.localStorage.setUser(username: account.username ?? "", password: account.password ?? "", fullname: account.fullname ?? "", age: account.age ?? 0, address: account.address ?? "")
                }
            }
        }
    }
}
