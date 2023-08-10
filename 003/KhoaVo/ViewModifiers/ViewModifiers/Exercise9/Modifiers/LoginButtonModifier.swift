//
//  LoginButtonModifier.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 01/08/2023.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {

    @Environment (\.isEnabled) var isEnabled

    func body(content: Content) -> some View {
        content
            .background {
                LinearGradient(colors: [Color(red: 1, green: 100/255, blue: 128/255),
                                        Color(red: 242/255, green: 46/255, blue: 99/255)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            }
    }
}

extension View {
    func loginButtonModifier() -> some View {
        self.modifier(LoginButtonModifier())
    }
}

struct LoginButtonTextModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.system(size: 14))
            .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 60))
    }
}

extension View {
    func loginButtonTextModifier() -> some View {
        self.modifier(LoginButtonTextModifier())
    }
}
