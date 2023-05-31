//
//  LoginViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import Foundation

enum ErrorLoginType {
    case invalid
    case connectFail
    
    func errorMessage() -> String {
        switch self {
        case .invalid:
            return "Tên email hoặc mật khẩu không chính xác"
        case .connectFail:
            return "Lỗi khi kết nối tới sever"
        }
    }
}

final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    @Published var forgotPasswordFlow : Bool = false
    @Published var registerFlow : Bool = false
    @Published var errorType: ErrorLoginType?
    @Published var loginSuccess: Bool = false
    @Published var jsonProvider: JSONProvider = JSONProvider()
    
    func isLoginDisable() -> Bool {
        return email.isValidEmail() && password != ""
    }
    
    @MainActor
    func checkLogin() async -> UserContainer? {
        do {
            try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
            let data = try await jsonProvider.getData()
            for item in data {
                if item.user?.email == email && item.user?.password == password {
                    loginSuccess = true
                    return item
                }
            }
            errorType = .invalid
        } catch {
            errorType = .connectFail
        }
        return nil
    }
}
