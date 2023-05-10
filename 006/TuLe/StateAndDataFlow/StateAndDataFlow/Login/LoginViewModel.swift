//
//  LoginViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowAlert: Bool = false
    @Published var titleError: String = ""
    @Published var contentError: String = ""
    
    @MainActor
    func handleLogin() async -> Data? {
        do {
            let user = User(email: email, password: password)
            let isLogin = try await DataManager().loadData(value: user)
            if isLogin {
                return user.saveData()
            } else {
                isShowAlert = true
                titleError = "Tài khoản hoặc mật khẩu không đúng"
                return nil
            }
        } catch {
            isShowAlert = true
            titleError = "Không thể kết nối tới server"
            return nil
        }
    }
}
