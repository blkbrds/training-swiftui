//
//  ListButtonView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 30/06/2023.
//

import SwiftUI

struct ListButtonView: View {
    var body: some View {

        VStack(spacing: 30) {
            CustomLayoutButtonView(title: "Facebook")
            CustomLayoutButtonView(title: "Youtube", subtitle: "Subscribe")
            CustomLayoutButtonView(imageName: "square.and.arrow.up.fill", title: "Instagram", subtitle: "Follow")
            CustomLayoutButtonView(imageName: "arrowshape.right.fill", title: "Twitter")
            IncreaseValueButtonView()
        }
    }
}
