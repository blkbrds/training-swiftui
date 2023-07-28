//
//  BadgeNumberView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct BadgeNumberView: View {

    var body: some View {
        VStack {
            ButtonBadgeView(title: "Email", backgroundColor: .green, alignment: .topTrailing, badgeCount: 10)
            ButtonBadgeView(title: "Friends", backgroundColor: .yellow, alignment: .topLeading, badgeCount: 100)
            ButtonBadgeView(title: "Photos", backgroundColor: .purple, alignment: .top, badgeCount: 8)
        }
    }
}

struct BadgeNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeNumberView()
    }
}
