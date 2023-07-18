//
//  DemoButtonView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct DemoButtonView: View {

    var body: some View {
        VStack(spacing: 20) {
            BaseButton(type: .facebook)
            BaseButton(type: .google)
            BaseButton(type: .apple)
            BaseButton(type: .none)
            BaseButton(type: .count)
        }
    }
}

struct DemoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DemoButtonView()
    }
}
