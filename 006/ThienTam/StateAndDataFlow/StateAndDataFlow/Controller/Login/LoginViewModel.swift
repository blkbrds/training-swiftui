//
//  LoginViewModel.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 18/06/2023.
//

import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var isShowAlert: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @Published var alertString: String = ""

    var titleButton: String { isLoginButtonEnabled ? "GET STARTED" : "LOGIN" }
    var colorButton: Color { isLoginButtonEnabled ? Color("submitButton") : Color.gray.opacity(0.5) }

    var isLoginButtonEnabled: Bool {
        return username.count >= 2 && password.count >= 8
    }

    func submitButton() async {
        isLoading = true
        do {
            let info = try await DataManager().checkLogin(userName: username, password: password)
            isLoading = false
            DispatchQueue.main.async {
                guard let info = info, (info.userId != nil) else {
                    self.alertString = "Invalid username or password"
                    self.isShowAlert = true
                    return
                }
                self.isShowAlert = false
                self.isLoggedIn = true
                self.saveInformation(userName: info.userName, fullName: info.fullName, userId: info.userId)
            }
        } catch {
            isLoading = false
            DispatchQueue.main.async {
                self.alertString = "No connent server"
                self.isShowAlert = true
            }
        }
    }

    func saveInformation(userName: String, fullName: String, userId: String?) {
        LocalStore.shared.setUser(userName: userName, fullName: fullName, userId: userId)
    }
}
