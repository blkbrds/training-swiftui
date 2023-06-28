//
//  ImageRoundedView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

struct ImageRoundedView: View {

    var imageName: String

    var body: some View {
        Image("\(imageName)")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .cornerRadius(300 / 2)
            .shadow(radius: 10)
    }
}
