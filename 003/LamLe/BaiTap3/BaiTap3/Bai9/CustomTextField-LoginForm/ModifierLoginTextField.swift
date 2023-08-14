//
//  ModifierLoginTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import SwiftUI


struct ModifierLoginTextField: ViewModifier {
    let systemImageString: String
    @State var isTappingShowPassword: Bool = false

    func body(content: Content) -> some View {
        ZStack {
            HStack {
                content
                    .frame(width: 310, height: 40)
                    .padding(.leading, 35)
                    .overlay(alignment: .leading) {
                        Image(systemName: systemImageString)
                            .padding(.leading, 10)
                    }
                    .border(LinearGradient(
                        colors: [
                            .red,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing))
            }
            .padding()
            .foregroundColor(.gray)
            .font(.system(size: 15, weight: .bold, design: .serif))
            .shadow(color: .purple, radius: 10)
        }

    }
}

extension View {
    func login(systemImageString: String) -> some View {
        ModifiedContent(
            content: self,
            modifier: ModifierLoginTextField(systemImageString: systemImageString)
        )
    }
}
