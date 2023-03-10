//
//  TextFieldModifier.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/02/2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {

    var type: TypeOfField = .userName

    func body(content: Content) -> some View {
        content
            .padding(.all, 15.0)
            .padding(.leading, 30)
            .font(.system(size: 23))
            .background(Color(red: 0.952, green: 0.942, blue: 0.938))
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
                .stroke(Color(red: 0.683, green: 0.597, blue: 0.501), lineWidth: 1)
        )
            .padding([.leading, .trailing, .top])
    }
}

extension View {
    func myTextFieldModifier(type: TypeOfField) -> some View {
        self.modifier(TextFieldModifier(type: type))
    }
}

