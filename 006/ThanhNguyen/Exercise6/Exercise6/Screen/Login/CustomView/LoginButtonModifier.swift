//
//  LoginButtonModifier.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {

    @Environment (\.isEnabled) var isEnabled

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 50)
            .foregroundColor(.white)
            .background(isEnabled ? Color("backgroundPink") : Color("disablePink"))
            .bold()
            .cornerRadius(5)
    }
}

extension View {
    func loginButton() -> some View {
        self.modifier(LoginButtonModifier())
    }
}


