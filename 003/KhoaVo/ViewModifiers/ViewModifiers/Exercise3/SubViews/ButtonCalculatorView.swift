//
//  ButtonCalculatorView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 21/06/2023.
//

import SwiftUI

struct ButtonCalculatorView: View {

    var title: String
    var buttonType: CalculatorButtonType

    var body: some View {
        Button(action: {
            print("Title of button \(title)")
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
