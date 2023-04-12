//
//  TextFieldModifier.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//


import SwiftUI

struct MyTextFieldModifier: ViewModifier {

    var type: TypeOfField = .userName

    func body(content: Content) -> some View {
        content
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding(.all, 15.0)
            .padding(.leading, 30)
            .font(.system(size: 23))
            .background(Color(red: 0.952, green: 0.942, blue: 0.938, opacity: 0.3))
            .cornerRadius(30)
            .overlay(
            HStack {
                Image(systemName: type.value().1)
                    .padding(.leading, 15)
                    .foregroundColor(.gray)
                Spacer()
            }
        )
            .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color("primaryColor"), lineWidth: 1)
        )
            .padding([.leading, .trailing, .top])
    }
}

extension View {
    func myTextFieldModifier(type: TypeOfField) -> some View {
        self.modifier(MyTextFieldModifier(type: type))
    }
}
