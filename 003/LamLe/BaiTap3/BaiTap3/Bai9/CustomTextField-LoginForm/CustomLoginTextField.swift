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
    @State var errorMessageEmailEmpty: String = ""
    @State var errorMessagePasswordEmpty: String = ""
    @State var isTappingShowPassword: Bool = false
    @State var errorMessageEmailInvalid: String = ""
    @State var errorMessagePasswordInvalid: String = ""
    
    @StateObject var viewModel = LoginFormViewModel()
    
    var body: some View {
        if !isPassword {
            TextField(title, text: $value)
                .onChange(of: value) { newValue in
                    errorMessageEmailEmpty = value.isEmpty ? "Email is not empty" : ""
                    errorMessageEmailInvalid = value.isEmpty ? "" : (viewModel.isValidEmail(value) ? "" : "Email is not invalid")
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
                    .onChange(of: value) { newValue in
                        errorMessagePasswordEmpty = value.isEmpty ? "Password is not empty" : ""
                        errorMessagePasswordInvalid = value.isEmpty ? "" : (viewModel.isValidPassword(value) ? "" : "Password is not invalid")
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
                    .onChange(of: value) { newValue in
                        errorMessagePasswordEmpty = value.isEmpty ? "Password is not empty" : ""
                        errorMessagePasswordInvalid = value.isEmpty ? "" : (viewModel.isValidPassword(value) ? "" : "Password is not invalid")
                    }
            }
        }
        ZStack {
            Text(isPassword ? errorMessagePasswordEmpty : errorMessageEmailEmpty)
                .font(.system(size: 15, weight: .bold, design: .serif))
                .foregroundColor(.red.opacity(0.8))
                .padding(.leading, 30)
            
            Text(isPassword ? errorMessagePasswordInvalid : errorMessageEmailInvalid)
                .font(.system(size: 15, weight: .bold, design: .serif))
                .foregroundColor(.red.opacity(0.8))
                .padding(.leading, 30)
        }
    }
}
