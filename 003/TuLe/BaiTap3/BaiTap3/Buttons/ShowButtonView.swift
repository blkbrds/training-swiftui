//
//  ShowButtonView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct ShowButtonView: View {

    @State var title1: Int = 1
    @State var title2: Int = 2

    var body: some View {
        VStack {
            ButtonView(title: $title1)
            ButtonView(title: $title2, subTitle: "SubTitle")
        }
    }
}

struct ShowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ShowButtonView()
    }
}
