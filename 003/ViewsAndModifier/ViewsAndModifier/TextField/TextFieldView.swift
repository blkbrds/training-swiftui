//
//  TextFieldView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/02/2023.
//

import SwiftUI

enum TypeOfField {
    case userName
    case password

    func value() -> (String, String) {
        switch self {
        case .userName:
            return ("Enter your name", "person")
        case .password:
            return ("Enter your password", "lock")
        }
    }
}

struct TextFieldView: View {
    @Binding var data: String
    @State var isShowPass: Bool = false
    var type: TypeOfField = .userName

    var body: some View {
        switch type {
        case .userName:
            TextField(type.value().0, text: $data)
                .myTextFieldModifier(type: type)
        case .password:
            if isShowPass {
                TextField(type.value().0, text: $data)
                    .myTextFieldModifier(type: type)
                    .overlay(
                    Button(action: { isShowPass.toggle() }) {
                        Image(systemName: isShowPass ? "eye" : "eye.slash")
                    }
                        .offset(x: UIScreen.main.bounds.width / 2 - 50, y: 10)
                )
            } else {
                SecureField(type.value().0, text: $data)
                    .myTextFieldModifier(type: type)
                    .overlay(
                    Button(action: { isShowPass.toggle() }) {
                        Image(systemName: isShowPass ? "eye" : "eye.slash")
                    }
                        .offset(x: UIScreen.main.bounds.width / 2 - 50, y: 10)
                )
            }
        }
    }
}
