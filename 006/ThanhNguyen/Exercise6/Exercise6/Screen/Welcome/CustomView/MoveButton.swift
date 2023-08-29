//
//  MoveButton.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/08/2023.
//

import SwiftUI

struct MoveButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60)
            .background(.black)
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .black, design: .serif))
            .cornerRadius(.infinity)
    }
}

extension View {
    func moveButton() -> some View {
        self.modifier(MoveButtonModifier())
    }
}
