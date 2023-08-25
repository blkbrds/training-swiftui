//
//  BadgeNumberView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

struct BadgeNumberView: View {
    
    var body: some View {
        VStack(spacing: 50.0) {
            CustomButton(backgroundColor: .green, textTitle: "Email", isBadgeCircle: false ,alignmentOfBadge: .topTrailing, positionX: 5, postionY: -10)
            
            CustomButton(backgroundColor: .yellow, textTitle: "Friends", isBadgeCircle: false ,alignmentOfBadge: .topLeading, positionX: -5, postionY: -10)
            
            CustomButton(backgroundColor: .purple, textTitle: "Photos", isBadgeCircle: true ,alignmentOfBadge: .center, positionX: 0, postionY: -35)
        }
    }
}

struct BadgeNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeNumberView()
    }
}
