//
//  LoginViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    @Published var forgotPasswordFlow : Bool = false
    @Published var registerFlow : Bool = false
    @Published var jsonProvider: JSONProvider = JSONProvider()
    @Published var contentError: String = ""
    
    func isLoginDisable() -> Bool {
        return email.isValidEmail() && password != ""
    }
    
    @MainActor
    func checkLogin() async -> UserContainer? {
        let result = await jsonProvider.getData()
        switch result {
        case .success(let data):
            guard let account = isValidAccount(data: data) else {
                contentError = "Sai tên đăng nhập hoặc mật khẩu"
                return nil
            }
            return account
        case .failure(let error):
            if let errorType = error as? CommonError {
                contentError = errorType.localizedDescription
            } else {
                contentError = CommonError.unknown.localizedDescription
            }
            return nil
        }
    }
    
    func isValidAccount(data: [UserContainer]) -> UserContainer? {
        for item in data {
            if item.user?.email == email && item.user?.password == password {
                return item
            }
        }
        return nil
    }
}
