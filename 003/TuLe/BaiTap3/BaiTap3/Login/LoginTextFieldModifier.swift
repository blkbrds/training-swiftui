//
//  LoginTextFieldModifier.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct LoginTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
            .cornerRadius(10)
            .padding(.top, 20)
            .padding(.horizontal, 40)
            .font(.system(size: 15))
    }
}
