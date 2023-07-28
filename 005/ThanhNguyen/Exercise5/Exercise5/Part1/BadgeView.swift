//
//  BadgeView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct BadgeView: View {

    @Binding var badgeCount: UInt

    var body: some View {
        Text(badgeCount > 99 ? "99+" : "\(badgeCount)")
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(.infinity)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badgeCount: .constant(100))
    }
}
