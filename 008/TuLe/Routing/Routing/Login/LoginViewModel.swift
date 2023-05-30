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
    
    func isLoginDisable() -> Bool {
        return email.isValidEmail() && password != ""
    }
    
    @MainActor
    func checkLogin() async throws -> UserContainer? {
        do {
            let data = try await jsonProvider.getData()
            for item in data {
                if item.user?.email == email && item.user?.password == password {
                    return item
                }
            }
        } catch {
            throw CommonError.networkError
        }
        return nil
    }
}
