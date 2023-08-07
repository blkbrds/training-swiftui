//
//  LoginFormViewModel.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import Foundation
import SwiftUI
import Combine

final class LoginFormViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func checkDisableLoginButton() -> Bool {
        if (email.isEmpty || password.isEmpty) {
            return true
        } else {
            if isValidEmail(email) && isValidPassword(password) {
                return false
            } else {
                return true
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        // Có chữ @ có dấu . sau dấu . là 2 chữ trở lên
        let regexEmail = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regexEmail.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // có chữ bắt đầu bằng in hoa, có ít nhất 1 ký tự đặc biệt, 1 chữ số và tổng độ dài từ 8 ký tự trở lên
        let regexPassword = try! NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&+=])[A-Za-z\\d@#$%^&+=]{8,}$", options: [.caseInsensitive])
        return regexPassword.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.utf16.count)) != nil
    }
    
}
