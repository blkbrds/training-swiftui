//
//  ButtonModifier.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {

    @Environment (\.isEnabled) var isEnabled

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 50)
            .background(isEnabled ? .black : .gray)
            .bold()
            .cornerRadius(5)
    }
}

extension View {
    func buttonModifier() -> some View {
        self.modifier(ButtonModifier())
    }
}
