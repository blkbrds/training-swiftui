//
//  BadgeNumberView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/03/2023.
//

import SwiftUI

struct BadgeNumberView: View {
    @State var numberBadge1: Int = 2
    @State var numberBadge2: Int = 28
    @State var numberBadge3: Int = 109
    
    var body: some View {

        VStack(spacing: 50){
            MyButton(numberBadge: $numberBadge1, typeButton: .email, typeBadgePosition: .bottomCenter)
            MyButton(numberBadge: $numberBadge2, typeButton: .friends, typeBadgePosition: .centerLeft)
            MyButton(numberBadge: $numberBadge3, typeButton: .photos, typeBadgePosition: .bottomRight)

        }
    }
}

struct BadgeNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeNumberView()
    }
}
