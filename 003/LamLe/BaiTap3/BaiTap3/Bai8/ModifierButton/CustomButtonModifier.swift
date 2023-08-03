//
//  CustomButtonModifier.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var backGroupButton: Color
    var textTileColor: Color

    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 80, alignment: .center)
            .background(backGroupButton)
            .foregroundColor(textTileColor)
            .shadow(color: Color.gray.opacity(1.0), radius: 3, x: 1, y: 2)
            .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))

    }
}

extension View {
    func buttonModifier(backGroupColor: Color, textTileColor: Color) -> some View {
        self.modifier(CustomButtonModifier(backGroupButton: backGroupColor, textTileColor: textTileColor))
    }
}