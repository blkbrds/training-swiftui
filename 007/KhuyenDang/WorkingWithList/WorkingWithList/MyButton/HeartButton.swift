//
//  HeartButton.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct HeartButton: View {

    @Binding var isLiked: Bool
    private let animationDuaration: Double = 0.2
    private var animationScale: CGFloat {
        isLiked ? 1.3 : 0.7
    }
    @State private var animate = false
    var body: some View {

        Button(action: {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuaration) {
                self.animate = false
            }
            isLiked.toggle()
        }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(isLiked ? .red : .gray)

            })
            .buttonStyle(PlainButtonStyle())
            .scaleEffect(animate ? animationScale : 1)
            .animation(.easeIn(duration: animationDuaration), value: isLiked)
    }
}
