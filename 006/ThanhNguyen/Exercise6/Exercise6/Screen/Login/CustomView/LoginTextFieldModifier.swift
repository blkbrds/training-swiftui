//
//  LoginTextFieldModifier.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import SwiftUI

struct LoginTextFieldModifier: ViewModifier {

    var type: LoginTextField.TextFieldType

    func body(content: Content) -> some View {
        content
            .padding(.leading, 20)
            .frame(height: 50)
            .font(.system(size: 15))
            .background(Color("backgroundTF"))
            .cornerRadius(8)
    }
}

extension View {
    func loginTextField(type: LoginTextField.TextFieldType) -> some View {
        self.modifier(LoginTextFieldModifier(type: type))
    }
}
