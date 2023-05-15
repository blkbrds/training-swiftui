//
//  LoginViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    @Published var logoScale = 0.0
    @Published var opacityTitle = 0.0
    @Published var isDelay: Bool = true
    @Published var forgotPasswordFlow : Bool = false
    @Published var registerFlow : Bool = false
    
    func isLoginDisable() -> Bool {
        return email.isValidEmail() && password != ""
    }
}
