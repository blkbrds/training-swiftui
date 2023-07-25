//
//  CustomTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @State var value: String
    var isPassword: Bool
    @State var isShowPass: Bool = false

    var body: some View {
        if !isPassword {
            TextField(title, text: $value)
                .beautyTextField(isPassword: isPassword)
                .padding()
                .foregroundColor(isPassword ? .red : .blue)
        } else {
            if isShowPass {
                TextField(title, text: $value)
                    .beautyTextField(isPassword: isPassword)
                    .padding()
                    .foregroundColor(isPassword ? .red : .blue)
                    .overlay(alignment: .trailing) {
                        Button(action: {
                            isShowPass = !isShowPass
                        }) {
                            Image(systemName: isShowPass ? "eye.circle" : "eye.slash.circle")
                        }
                        .padding(.trailing, 30)
                        .foregroundColor(.gray)
                        .shadow(color: .purple, radius: 10)
                }
            } else {
                SecureField(title, text: $value)
                    .beautyTextField(isPassword: isPassword)
                    .padding()
                    .foregroundColor(isPassword ? .red : .blue)
                    .overlay(alignment: .trailing) {
                        Button(action: {
                            isShowPass = !isShowPass
                        }) {
                            Image(systemName: isShowPass ? "eye.circle" : "eye.slash.circle")
                        }
                        .padding(.trailing, 30)
                        .foregroundColor(.gray)
                        .shadow(color: .purple, radius: 10)
                }
            }
        }
    }
}
