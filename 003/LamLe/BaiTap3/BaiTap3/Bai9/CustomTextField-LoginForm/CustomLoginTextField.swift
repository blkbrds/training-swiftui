//
//  CustomLoginTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import SwiftUI

struct CustomLoginTextField: View {
    var title: String
    @Binding var value: String
    var isPassword: Bool
    @State var errorMessageEmail: String = ""
    @State var errorMessagePassword: String = ""
    @State var isTappingShowPassword: Bool = false
    
    @StateObject var viewModel = LoginFormViewModel()
    
    var body: some View {
        if !isPassword {
            TextField(title, text: $value)
                .onChange(of: value) { _ in
                    guard let checkEmptyEmail = viewModel.checkEmptyEmail(value) else {
                        errorMessageEmail = viewModel.checkValidateFormatEmail(value)
                        return
                    }
                    errorMessageEmail = checkEmptyEmail
                }
                .login(systemImageString: "person")
        } else {
            if isTappingShowPassword {
                TextField(title, text: $value)
                    .login(systemImageString: "lock")
                    .overlay(alignment: .trailing) {
                        Button(action: {
                            isTappingShowPassword = !isTappingShowPassword
                        }) {
                            Image(systemName: isTappingShowPassword ? "eye.circle" : "eye.slash.circle")
                        }
                        .padding(.trailing, 30)
                        .foregroundColor(.gray)
                        .shadow(color: .purple, radius: 10)
                        
                    }
                    .onChange(of: value) { _ in
                        guard let checkEmptyPassword = viewModel.checkEmptyPassword(value) else {
                            errorMessagePassword = viewModel.checkValidateFormatPassword(value)
                            return
                        }
                        errorMessagePassword = checkEmptyPassword
                    }
            } else {
                SecureField(title, text: $value)
                    .login(systemImageString: "lock")
                    .overlay(alignment: .trailing) {
                        Button(action: {
                            isTappingShowPassword = !isTappingShowPassword
                        }) {
                            Image(systemName: isTappingShowPassword ? "eye.circle" : "eye.slash.circle")
                        }
                        .padding(.trailing, 30)
                        .foregroundColor(.gray)
                        .shadow(color: .purple, radius: 10)
                        
                    }
                    .onChange(of: value) { _ in
                        guard let checkEmptyPassword = viewModel.checkEmptyPassword(value) else {
                            errorMessagePassword = viewModel.checkValidateFormatPassword(value)
                            return
                        }
                        errorMessagePassword = checkEmptyPassword
                    }
            }
        }
        Text(isPassword ? errorMessagePassword : errorMessageEmail)
            .font(.system(size: 15, weight: .bold, design: .serif))
            .foregroundColor(.red.opacity(0.8))
            .padding(.leading, 30)
    }
}
