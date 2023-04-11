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
            .background(isEnabled ? Color("bearColor") : Color(red: 0.624, green: 0.475, blue: 0.347, opacity: 0.523))
            .cornerRadius(30)
            .shadow(radius: 5)
    }
}

extension View {
    func myButtonModifier() -> some View {
        self.modifier(MyButtonModifier())
    }
}
