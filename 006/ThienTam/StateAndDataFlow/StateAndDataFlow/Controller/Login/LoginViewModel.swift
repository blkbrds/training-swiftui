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

    var titleButton: String { isLoginButtonEnabled ? "GET STARTED" : "LOGIN" }
    var colorButton: Color { isLoginButtonEnabled ? Color("submitButton") : Color.gray.opacity(0.5) }

    var isLoginButtonEnabled: Bool {
        return username.count >= 2 && password.count >= 8
    }

    func submitButton(completion: @escaping () -> Void) {
        isLoading = true
        Task {
            let userId = try await DataManager().checkLogin(userName: username, password: password)?.userId
            isLoading = false
            if userId != nil {
                isShowAlert = false
                completion()
            } else {
                isShowAlert = true
            }
        }
    }
}
