//
//  GradientButtonModifier.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

struct GradientButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .padding(15)
            .foregroundColor(.white)
            .background(
                AngularGradient(gradient: Gradient(colors: [.pink, .purple, .red]), center: .center)
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension View {
    func gradientButtonModifier() -> some View {
        self.modifier(GradientButtonModifier())
    }
}
