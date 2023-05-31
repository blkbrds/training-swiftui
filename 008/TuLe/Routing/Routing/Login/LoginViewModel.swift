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
        do {
            let data = try await jsonProvider.getData()
            guard let account = isValidAccount(data: data) else {
                contentError = "Sai tên đăng nhập hoặc mật khẩu"
                return nil
            }
            return account
        } catch CommonError.fileNotFound {
            contentError = CommonError.fileNotFound.localizedDescription
        } catch CommonError.errorParsing {
            contentError = CommonError.errorParsing.localizedDescription
        } catch CommonError.errorURL {
            contentError = CommonError.errorURL.localizedDescription
        } catch {
            contentError = CommonError.unknown.localizedDescription
        }
        return nil
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
