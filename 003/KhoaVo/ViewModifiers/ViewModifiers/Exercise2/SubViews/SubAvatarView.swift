//
//  SubAvatarView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 20/06/2023.
//

import SwiftUI

struct SubAvatarView: View {

    var measurementWidth: CGFloat = 60
    var imageName: String
    var index: Int
    var characterName: String
    var viewWidth: CGFloat
    var viewHeight: CGFloat

    var action: ((Int) -> Void)?

    var body: some View {
        VStack(spacing: 15) {
            Image("\(imageName)")
                .resizable()
                .frame(width: measurementWidth, height: measurementWidth)
                .cornerRadius(measurementWidth / 2)
                .scaledToFill()
                .shadow(radius: 10)
                .onTapGesture {
                    action!(index)
                }
            Text("\(characterName)")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: viewWidth - 20)
                .shadow(radius: 10)
        }
        .background(.clear)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(.white, width: 1)
        .shadow(radius: 10)
    }

    func onAvatarPress(action: @escaping (Int) -> Void ) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}
