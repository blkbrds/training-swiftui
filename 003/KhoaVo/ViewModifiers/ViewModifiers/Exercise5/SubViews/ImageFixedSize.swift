//
//  ImageFixedSize.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

struct ImageFixedSize: View {

    var imageName: String

    var body: some View {
        Image("\(imageName)")
            .resizable()
            .scaledToFit()
            // .scaledToFill()
            .frame(width: 250, height: 400)
    }
}
