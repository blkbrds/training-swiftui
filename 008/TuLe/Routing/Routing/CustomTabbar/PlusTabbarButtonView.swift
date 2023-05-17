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
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width + 15 , height: height + 15)
                .foregroundColor(Color(red: 35 / 255, green: 157 / 255, blue: 251 / 255))
                .cornerRadius(25)
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            action()
        }
    }
}
