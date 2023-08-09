//
//  ButtonBadgeView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct ButtonBadgeView: View {

    var title: String
    var backgroundColor: Color
    var alignment: Alignment
    @State var badgeCount: UInt

    var body: some View {
        ZStack(alignment: alignment) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 150, height: 80)
                .overlay {
                    Button(title) {
                        print(title, badgeCount)
                    }
                    .frame(width: 130, height: 60)
                    .foregroundColor(.white)
                    .background(backgroundColor)
                    .cornerRadius(15)
                }
            if badgeCount != 0 {
                BadgeView(badgeCount: $badgeCount)
            }
        }
    }
}

struct ButtonBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBadgeView(
            title: "Email",
            backgroundColor: .green,
            alignment: .topTrailing,
            badgeCount: 10
        )
    }
}
