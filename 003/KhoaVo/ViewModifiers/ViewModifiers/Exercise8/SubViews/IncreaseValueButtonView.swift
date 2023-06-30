//
//  IncreaseValueButtonView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

struct IncreaseValueButtonView: View {

    @State var value: Int = 0

    var body: some View {
        Button(action: {
            value += 1
        }, label: {
            Text("Value: \(value)")
                .font(.system(size: 20))
                .fontWeight(.bold)
        })
        .buttonModifier()
    }
}
