//
//  TextModifier.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct TextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func textModifier() -> some View {
        self.modifier(TextModifier())
    }
}
