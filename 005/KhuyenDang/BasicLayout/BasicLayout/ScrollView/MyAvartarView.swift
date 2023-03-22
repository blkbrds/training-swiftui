//
//  MyAvartarView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI
struct MyAvatarView: View {

    var body: some View {

        Image("avatar")
            .resizable()
            .cornerRadius(10)
            .overlay(
                Rectangle()
                    .mask(Circle())
                    .foregroundColor(.red)
                    .frame(width: 15, height: 15)
                    .offset(x: 28, y: -28)
            )
            .frame(width: 56, height: 56)

    }
}
