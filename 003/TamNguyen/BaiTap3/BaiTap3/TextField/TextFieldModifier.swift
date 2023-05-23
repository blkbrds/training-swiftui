//
//  TextFieldModifier.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/05/2023.
//

import SwiftUI

enum KindOfInput {
    case userName
    case password
    
    func toPlaceHolder() -> String {
        switch self {
        case .userName:
            return "Enter your name"
        case .password:
            return "Enter your password"
        }
    }
}

struct TextFieldModifier: ViewModifier {
    
    var kind: KindOfInput = .userName
    
    func body(content: Content) -> some View {
        switch kind {
        case .userName:
            content
                .padding(.horizontal, 20)
        case .password:
            content
                .padding(.horizontal, 20)
                .textFieldStyle(.plain)
        }
    }
}

extension View {
    func textFieldModifier(kind: KindOfInput) -> some View {
        self.modifier(TextFieldModifier(kind: kind))
    }
}
