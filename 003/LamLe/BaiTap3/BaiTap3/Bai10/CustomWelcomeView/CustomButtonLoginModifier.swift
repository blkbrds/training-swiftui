//
//  CustomButtonLoginModifier.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/25/23.
//

import SwiftUI

struct CustomButtonLoginModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 50)
            .background(LinearGradient(colors: [Color("LoginButtonColor"), Color(red: 254/255, green: 249/255, blue: 237/255)], startPoint: .topTrailing, endPoint: .bottomLeading))
            .cornerRadius(20)
            .shadow(color: Color("LoginButtonColor"), radius: 4)
    }
}

extension View {
    func buttonLoginModifier() -> some View {
        self.modifier(CustomButtonLoginModifier())
    }
}
