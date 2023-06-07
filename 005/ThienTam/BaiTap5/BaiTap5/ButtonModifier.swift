//
//  ButtonModifier.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    var kind: PositionBadgeNumber

    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 70)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding(.leading, kind.horizontal == .leading ? 0 : 25)
    }
}

extension View {
    func buttonModifier(kind: PositionBadgeNumber) -> some View {
        self.modifier(ButtonModifier(kind: kind))
    }
}

