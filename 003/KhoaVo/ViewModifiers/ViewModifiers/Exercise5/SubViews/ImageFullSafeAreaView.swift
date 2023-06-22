//
//  ImageFullSafeAreaView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

struct ImageFullSafeAreaView: View {

    var imageName: String

    var body: some View {
        Image("\(imageName)")
            .resizable()
            .scaledToFit()
            //.scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}
