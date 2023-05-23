//
//  Buttons.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/05/2023.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack(spacing: 30) {
            CustomButton(icon: "facebook", subtitle: "Go to facebook")
            CustomButton(icon: "google")
            CustomButton()
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
