//
//  ButtonModifier.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

struct MyButtonModifier: ViewModifier {

    @Environment(\.isEnabled) var isEnabled
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
            .foregroundColor(.white)
            .background(isEnabled ? Color("primaryColor") : Color("primaryColor50%"))
            .cornerRadius(30)
            .shadow(radius: 5)
    }
}

extension View {
    func myButtonModifier() -> some View {
        self.modifier(MyButtonModifier())
    }
}
