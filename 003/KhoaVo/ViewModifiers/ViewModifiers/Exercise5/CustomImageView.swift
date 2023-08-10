//
//  CustomImageView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

enum CustomImageDisplayType {
    case fullscreen
    case fullSafeArea
    case fixedSize
    case roundedCorner
    case textOverImage
}

struct CustomImageView: View {

    var imageName: String = "img-naruto-background"
    var type: CustomImageDisplayType = .textOverImage

    var body: some View {
        switch type {
        case .fullscreen:
            ImageFullScreenView(imageName: imageName)
        case .fullSafeArea:
            ImageFullSafeAreaView(imageName: imageName)
        case .fixedSize:
            ImageFixedSize(imageName: imageName)
        case .roundedCorner:
            ImageRoundedView(imageName: imageName)
        case .textOverImage:
            ImageUnderTextView()
        }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView()
    }
}
