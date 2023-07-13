//
//  TextFieldModifier.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct DarkTextFieldModifier: ViewModifier {

    var textFieldType: BaseTextField.TextFieldType

    func body(content: Content) -> some View {
        content
            .padding(.leading, 20)
            .frame(height: 50)
            .font(.system(size: 20))
            .background(.white)
            .overlay(
                Rectangle()
                    .stroke(.black, lineWidth: 1.5)
            )
    }
}

extension View {
    func baseTextField(type: BaseTextField.TextFieldType) -> some View {
        self.modifier(DarkTextFieldModifier(textFieldType: type))
    }
}
