//
//  MyButton.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MyButton: ViewModifier {

    @Environment(\.isEnabled) var isEnabled

    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.white)
            .background(isEnabled ? Color("green") : Color("green").opacity(0.8))
            .cornerRadius(10)
    }
}

extension View {
    func myButtonModifier() -> some View {
        self.modifier(MyButton())
    }
}
