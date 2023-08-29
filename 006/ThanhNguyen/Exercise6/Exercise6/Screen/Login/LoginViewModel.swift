//
//  LoginViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorTitle: String = ""
    @Published var isValidate = false
    @Published var isChecked = false
    @Published var shouldShowErrorAlert = false
    @Published var shouldShowLoading = false
    private var localStorage = LocalStorage()

    @MainActor func validateAccount() async -> Bool {
        do {
            let account: Account = .init(id: 0, email: email, password: password, address: "", nickname: "")
            let validAccount = try await DataManager().validateAccount(account: account)
            if let validAccount {
                localStorage.saveAccount(account: validAccount)
                return true
            } else {
                errorTitle = "Email or password is invalid"
                shouldShowErrorAlert = true
                return false
            }
        } catch {
            errorTitle = "Internet error, please try again later"
            shouldShowErrorAlert = true
            return false
        }
    }

    func validateSignInButton() -> Bool {
        return email.isMatch(regex: Constants.emailRegex)
        && password.isMatch(regex: Constants.passwordRegex)
    }
}
