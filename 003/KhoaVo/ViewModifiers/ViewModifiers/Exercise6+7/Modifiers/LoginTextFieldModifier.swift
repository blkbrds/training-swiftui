//
//  SubTextFieldStyleView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 23/06/2023.
//

import SwiftUI

struct LoginTextFieldModifier: ViewModifier {

    var type: TextFieldType = .username

    func body(content: Content) -> some View {
        content
            .padding(.all, 20)
            .padding(.leading, 40)
            .padding(.trailing, 25)
            .font(.system(size: 15))
            .foregroundColor(.gray)
            .background(type.textFieldBackground)
            .tint(type.tintColor)
            .cornerRadius(10)
            .overlay(
                HStack {
                    Image(systemName: type.imagePlaceHolder)
                        .padding(.leading, 15)
                        .foregroundColor(type.tintColor)
                    Spacer()
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(type.textFieldBorder, lineWidth: 0.5)
            )
            .padding(.all, 20)
    }
}

extension View {
    func loginTextFieldModifier(type: TextFieldType) -> some View {
        self.modifier(LoginTextFieldModifier(type: type))
    }
}
