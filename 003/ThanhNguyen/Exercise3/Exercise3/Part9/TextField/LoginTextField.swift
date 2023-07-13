//
//  LoginTextField.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 12/07/2023.
//

import SwiftUI

struct LoginTextField: View {

    enum TextFieldType {
        case email
        case password

        var placeHolder: String {
            switch self {
            case .email: return "Enter your email"
            case .password: return "Password"
            }
        }
    }

    @Binding var data: String
    @State var isShowPass: Bool = false
    var type: TextFieldType = .email

    var body: some View {
        GeometryReader { geo in
            switch type {
            case .email:
                TextField(type.placeHolder, text: $data)
                    .loginTextField(type: type)
            case .password:
                if isShowPass {
                    TextField(type.placeHolder, text: $data)
                        .loginTextField(type: type)
                        .overlay(alignment: .trailing) {
                            Button(action: { isShowPass.toggle() }) {
                                Image(systemName: isShowPass ? "eye" : "eye.slash")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 30)
                        }
                } else {
                    SecureField(type.placeHolder, text: $data)
                        .loginTextField(type: type)
                        .overlay(alignment: .trailing) {
                            Button(action: { isShowPass.toggle() }) {
                                Image(systemName: isShowPass ? "eye" : "eye.slash")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 30)
                        }
                }
            }
        }
    }
}

