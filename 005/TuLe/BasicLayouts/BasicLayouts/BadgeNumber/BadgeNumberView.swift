//
//  BadgeNumberView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 14/03/2023.
//

import SwiftUI

struct BadgeNumberView: View {

    var body: some View {
        VStack(spacing: 30) {
            ButtonBadgeView(title: "Email", backgroundColor: .blue, badgeTitle: "1", alignment: .topTrailing)
            ButtonBadgeView(title: "Friends", backgroundColor: .yellow, badgeTitle: "100", alignment: .topLeading)
            ButtonBadgeView(title: "Photos", backgroundColor: .purple, badgeTitle: "20", alignment: .top)
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
    var alignment: Alignment
    
    var body: some View {
        ZStack(alignment: alignment) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 140, height: 80)
                .overlay {
                    Button(title) {
                        print("Button pressed!")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 130, height: 60)
                    .background(backgroundColor)
                    .clipShape(Capsule())
                }
            
            BadgeView(title: badgeTitle)
        }
    }
}

struct BadgeView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            .background(.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}
