//
//  ButtonModifier.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 300, maxHeight: 50)
            .clipShape(RoundedRectangle(cornerRadius: .infinity, style: .continuous))
    }
}

extension View {
    func buttonModifier() -> some View {
        self.modifier(ButtonModifier())
    }
}
