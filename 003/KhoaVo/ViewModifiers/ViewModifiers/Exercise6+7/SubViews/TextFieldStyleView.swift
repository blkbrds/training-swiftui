//
//  TextFieldStyleView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

enum TextFieldType {
    case username
    case password

    var placeholder: String {
        switch self {
        case .username:
            return "Email or username"
        case .password:
            return "Password"
        }
    }

    var imagePlaceHolder: String {
        switch self {
        case .username:
            return "mail.fill"
        case .password:
            return "exclamationmark.lock.fill"
        }
    }

    var passwordShowing: String {
        return "eye.slash.fill"
    }

    var passwordLock: String {
        return "eye.fill"
    }

    var tintColor: Color {
        return Color("ButtonTintColor")
    }

    var textFieldBackground: Color {
        return Color("TextFieldBackground")
    }

    var textFieldBorder: Color {
        return Color("TextFieldBorder")
    }
}

struct TextFieldStyleView: View {
    var type: TextFieldType
    @Binding var data: String
    @State var isShowingPassword: Bool = false

    var body: some View {
        switch type {
        case .username:
            TextField(type.placeholder, text: $data)
                .loginTextFieldModifier(type: type)
        case .password:
            if isShowingPassword {
                TextField(type.placeholder, text: $data)
                    .loginTextFieldModifier(type: type)
                    .overlay(alignment: .trailing, content: {
                        Button(action: {
                            isShowingPassword = !isShowingPassword
                        }) {
                            Image(systemName: isShowingPassword ? type.passwordLock : type.passwordShowing)
                                .tint(type.tintColor)
                        }
                        .padding(.trailing, 30)
                    })
            } else {
                SecureField(type.placeholder, text: $data)
                    .loginTextFieldModifier(type: type)
                    .overlay(alignment: .trailing, content: {
                        Button(action: {
                            isShowingPassword = !isShowingPassword
                        }) {
                            Image(systemName: isShowingPassword ? type.passwordLock : type.passwordShowing)
                                .tint(type.tintColor)
                        }
                        .padding(.trailing, 30)
                    })
            }
        }
    }
}
