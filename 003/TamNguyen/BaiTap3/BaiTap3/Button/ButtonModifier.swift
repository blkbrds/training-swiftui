//
//  ButtonModifier.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/05/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    @Environment (\.isEnabled) var isEnabled
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 50)
            .background(isEnabled ? Color("textColor") : Color(red: 0.624, green: 0.475, blue: 0.347, opacity: 0.523))
            .bold()
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

extension View {
    func submitButtonModifier() -> some View {
        self.modifier(ButtonModifier())
    }
}
