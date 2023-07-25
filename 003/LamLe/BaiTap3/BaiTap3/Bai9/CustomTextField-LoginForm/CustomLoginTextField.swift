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
    @State var errorMessageUserName = ""
    @State var errorMessagePassword = ""
    @State var isTappingShowPassword: Bool = false
    
    var body: some View {
        if !isPassword {
            TextField(title, text: $value) { isBegin in
                if isBegin {
                    print("Bắt đầu nhập")
                } else {
                    print("Kết thúc nhập")
                    errorMessageUserName = value.isEmpty ? "Username is not empty" : ""
                }
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
                                errorMessagePassword = value.isEmpty ? "Password is not empty" : ""
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
                        errorMessagePassword = value.isEmpty ? "Password is not empty" : ""
                }
            }
        }
        Text(isPassword ? errorMessagePassword : errorMessageUserName)
            .font(.system(size: 15, weight: .bold, design: .serif))
            .foregroundColor(.red.opacity(0.8))
            .padding(.leading, 30)
    }
}
