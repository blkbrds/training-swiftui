//
//  BadgeNumberView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 14/03/2023.
//

import SwiftUI

struct BadgeNumberView: View {

    var topRightPosition: CGPoint = CGPoint(x: 50, y: -25)
    var topLeftPosition: CGPoint = CGPoint(x: -50, y: -25)
    var topCenterPosition: CGPoint = CGPoint(x: 0, y: -25)
    var bottomRightPosition: CGPoint = CGPoint(x: 50, y: 25)
    var bottomLeftPosition: CGPoint = CGPoint(x: -50, y: 25)
    var bottomLeftPositionCenterPosition: CGPoint = CGPoint(x: 0, y: 25)

    var body: some View {
        VStack(spacing: 30) {
            ButtonBadgeView(title: "Email", backgroundColor: .blue, badgeTitle: "1", position: topRightPosition)
            ButtonBadgeView(title: "Friends", backgroundColor: .yellow, badgeTitle: "100", position: topLeftPosition)
            ButtonBadgeView(title: "Photos", backgroundColor: .purple, badgeTitle: "20", position: topCenterPosition)
        }
        .padding()
    }
}

struct BadgeNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeNumberView()
    }
}

struct ButtonBadgeView: View {
    
    var title: String
    var backgroundColor: Color
    var badgeTitle: String
    var position: CGPoint
    
    var body: some View {
        Button(title) {
            print("Button pressed!")
        }
        .padding()
        .foregroundColor(.white)
        .frame(width: 130, height: 60)
        .background(backgroundColor)
        .clipShape(Capsule())
        .overlay {
            Text(badgeTitle)
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                .background(.red)
                .clipShape(Capsule())
                .foregroundColor(.white)
                .offset(x: position.x, y: position.y)
        }
    }
}
