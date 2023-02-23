//
//  ButtonModifier.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/02/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
            .foregroundColor(.white)
            .padding(.all)
            .background(Color(red: 0.608, green: 0.486, blue: 0.378))
            .cornerRadius(30)
            .shadow(radius: 5)
    }
}

extension View {
    func buttonModifier() -> some View {
        self.modifier(ButtonModifier())
    }
}
