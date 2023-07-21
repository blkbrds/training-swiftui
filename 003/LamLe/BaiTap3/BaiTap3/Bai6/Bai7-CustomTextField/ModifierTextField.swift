//
//  ModifierTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct CustomModifỉer: ViewModifier {
    var isPassword: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.clear)
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 2)
            .foregroundColor(isPassword == true ? .red : .blue)
            .multilineTextAlignment(.leading)
            .fontWeight(.bold)
            )
            .shadow(color: Color.gray.opacity(1.0), radius: 3, x: 1, y: 2)
    }
}

extension View {
    func beautyTextField(isPassword: Bool) -> some View {
        ModifiedContent(
            content: self,
            modifier: CustomModifỉer(isPassword: isPassword)
        )
    }
}
