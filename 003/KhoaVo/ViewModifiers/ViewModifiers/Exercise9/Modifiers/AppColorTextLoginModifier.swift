//
//  LoginButtonModifier.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 30/06/2023.
//

import SwiftUI

struct AppColorTitleTextLoginModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(Define.loginTintColor))
            .font(.system(size: 24))
            .fontWeight(.bold)
    }
}

struct AppColorTextLoginModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(Define.loginTintColor))
            .font(.system(size: 14))
            .fontWeight(.bold)
    }
}

struct NormalTextLoginModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 14))
            .fontWeight(.regular)
    }
}

// MARK: - Extension
extension View {

    func appColorTextLoginModifier() -> some View {
        self.modifier(AppColorTextLoginModifier())
    }

    func appColorTitleTextLoginModifier() -> some View {
        self.modifier(AppColorTitleTextLoginModifier())
    }

    func normalTextLoginModifier() -> some View {
        self.modifier(NormalTextLoginModifier())
    }
}
