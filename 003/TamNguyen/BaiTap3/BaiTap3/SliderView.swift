//
//  SliderView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 16/05/2023.
//

import SwiftUI

struct SliderView: View {

    @State var red: Double = 0
    @State var green: Double = 0
    @State var blue: Double = 0

    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
                .mask(Circle())
                .shadow(radius: 5)

            VStack(spacing: 20) {
                CustomSliderView(colorString: "red", value: $red)
                CustomSliderView(colorString: "green", value: $green)
                CustomSliderView(colorString: "blue", value: $blue)
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
