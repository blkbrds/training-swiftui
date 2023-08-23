//
//  LoginViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {

    private struct Constants {
        // Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
        static let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorTitle: String = ""
    @Published var isValidate = false
    @Published var isChecked = false
    @Published var shouldShowErrorAlert = false
    private var localStorage = LocalStorage()

    func validateAccount() async {
        do {
            let account: Account = .init(id: 0, email: email, password: password)
            let isValidAccount = try await DataManager().validateAccount(account: account)
            if isValidAccount {
                localStorage.saveAccount(account: account)
                print("success")
            } else {
                errorTitle = "Email or password is invalid"
                shouldShowErrorAlert = true
            }
        } catch {
            errorTitle = "Internet error, please try again later"
            shouldShowErrorAlert = true
        }
    }

    func validateSignInButton() -> Bool {
        return email.isMatch(regex: Constants.emailRegex)
        && password.isMatch(regex: Constants.passwordRegex)
    }
}

extension String {
    public func isMatch(regex: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regex) else { return false }
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex.firstMatch(in: self, range: range) != nil
    }
}
