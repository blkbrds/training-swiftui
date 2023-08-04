//
//  ButtonCalculatorView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 21/06/2023.
//

import SwiftUI

struct ButtonCalculatorView: View {

    @Binding var input: String
    var title: String
    var buttonType: CalculatorButtonType

    var body: some View {
        Button(action: {
            input = title
        }, label: {
            Text("\(title)")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .background(buttonType.backgroundColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
