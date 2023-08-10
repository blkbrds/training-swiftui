//
//  LoginFormViewModel.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import Foundation
import SwiftUI

final class LoginFormViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func checkDisableLoginButton() -> Bool {
        if (email.isEmpty || password.isEmpty) {
            return true
        } else {
            if checkValidateFormatEmail(email).isEmpty && checkValidateFormatPassword(password).isEmpty {
                return false
            } else {
                return true
            }
        }
    }
    
    func checkEmptyEmail(_ email: String) -> String? {
        return email.isEmpty ? "Email not empty" : nil
    }
    
    func checkEmptyPassword(_ password: String) -> String? {
        return password.isEmpty ? "Password not empty" : nil
    }
    
    func checkValidateFormatEmail(_ email: String) -> String {
        // Có chữ @ có dấu . sau dấu . là 2 chữ trở lên
        let regexEmail = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
            return regexEmail.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil ? "" : "Email Is Invalid"
    }
    
    func checkValidateFormatPassword(_ password: String) -> String {
        // có chữ bắt đầu bằng in hoa, có ít nhất 1 ký tự đặc biệt, 1 chữ số và tổng độ dài từ 8 ký tự trở lên
        let regexPassword = try! NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&+=])[A-Za-z\\d@#$%^&+=]{8,}$", options: [.caseInsensitive])
            return regexPassword.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.utf16.count)) != nil ? "" : "Password Is Invalid"
    }
}
