//
//  LoginViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {

    enum LoginState {
        case success
        case loading
        case initial
        case invalid
        case internetError

        var errorTitle: String {
            switch self {
            case .invalid:
                return "Email or password is invalid"
            case .internetError:
                return "Internet error, please try again later"
            default: return ""
            }
        }
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isChecked = false
    @Published var shouldShowErrorAlert = false
    @Published var state: LoginState = .initial {
        didSet {
            shouldShowErrorAlert = state.isOneOf(.invalid, .internetError)
        }
    }

    private let localStorage = LocalStorage()

    @MainActor func validateAccount() async {
        do {
            state = .loading
            let account: Account = .init(id: 0, email: email, password: password, address: "", nickname: "")
            let validAccount = try await DataManager().validateAccount(account: account)
            if let validAccount {
                localStorage.saveAccount(account: validAccount)
                state = .success
            } else {
                state = .invalid
            }
        } catch {
            state = .internetError
        }
    }

    func validateSignInButton() -> Bool {
        return email.isMatch(regex: Constants.emailRegex)
        && password.isMatch(regex: Constants.passwordRegex)
    }
}
