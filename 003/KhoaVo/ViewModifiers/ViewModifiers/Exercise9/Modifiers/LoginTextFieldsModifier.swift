//
//  LoginTextFieldsModifier.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 02/08/2023.
//

import SwiftUI

struct LoginTextFieldsModifier: ViewModifier {

    var submitType: SubmitLabel = .next

    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], 40)
            .tint(Color(Define.loginTintColor))
            .submitLabel(submitType)
            .overlay(alignment: .bottom) {
                ZStack { }
                .frame(width: 300, height: 1)
                .background(Color(Define.loginTintColor))
                .offset(x: 0, y: 7)
            }
    }
}

extension View {
    func loginTextFieldsModifier(submitType: SubmitLabel) -> some View {
        self.modifier(LoginTextFieldsModifier(submitType: submitType))
    }
}
