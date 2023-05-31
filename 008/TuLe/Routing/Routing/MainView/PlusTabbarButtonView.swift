//
//  PlusTabbarButtonView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 17/05/2023.
//

import SwiftUI

struct PlusTabbarButtonView: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    var action: () -> Void

    var body: some View {
        ZStack {
            Image(systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20 , height: 16)
                .rotationEffect(.degrees(-45))
                .background(.clear)
        }
        .frame(width: width + 15, height: height + 15)
        .background(
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 82 / 255, green: 57 / 255, blue: 151 / 255),
                Color(red: 107 / 255, green: 100 / 255, blue: 200 / 255)
            ]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(25)
        .padding(.horizontal, -4)
        .onTapGesture {
            action()
        }
    }
}
