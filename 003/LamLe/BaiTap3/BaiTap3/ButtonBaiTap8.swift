//
//  ButtonBaiTap8.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/11/23.
//

import SwiftUI

struct ButtonBaiTap8: View {
    var body: some View {
        VStack {
            CustomButton(title: "Facebook", subTitle: "Mark Zuckerberg", nameIcon: "facebook", backGroupColor: .blue.opacity(0.8))
            CustomButton(title: "Google", subTitle: "Larry Page", nameIcon: "google", backGroupColor: .white.opacity(0.7), textTitleColor: .black.opacity(0.9))
            CustomButton(title: "Twitter", subTitle: "Elon Musk", nameIcon: "twitter", backGroupColor: .blue.opacity(0.6))
        }
    }
}

struct ButtonBaiTap8_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBaiTap8()
    }
}
