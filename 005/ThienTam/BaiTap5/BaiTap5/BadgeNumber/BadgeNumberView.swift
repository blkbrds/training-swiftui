//
//  BadgeNumberView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 25/06/2023.
//

import SwiftUI

struct BadgeNumberView: View {

    @State var numberBadge1: Int = 20
    @State var numberBadge2: Int = 4
    @State var numberBadge3: Int = 109

    var body: some View {
        VStack(spacing: 50) {
            ButtonBadge(numberBadge: $numberBadge1, typeButton: .email, typeBadgePosition: .bottomCenter)
            ButtonBadge(numberBadge: $numberBadge2, typeButton: .friends, typeBadgePosition: .centerLeft)
            ButtonBadge(numberBadge: $numberBadge3, typeButton: .photos, typeBadgePosition: .bottomRight)

        }
    }
}

struct BadgeNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeNumberView()
    }
}
