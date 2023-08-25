//
//  CustomButtonModifier.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//
import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var backGroupButton: Color

    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 70, alignment: .center)
            .background(backGroupButton)
            .foregroundColor(.white)
            .shadow(color: Color.gray.opacity(1.0), radius: 3, x: 1, y: 2)
            .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .font(.system(size: 20, weight: .bold, design: .serif))

    }
}

extension View {
    func buttonModifier(backGroupColor: Color) -> some View {
        self.modifier(CustomButtonModifier(backGroupButton: backGroupColor))
    }
}
