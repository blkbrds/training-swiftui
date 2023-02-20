//
//  ColorSliderView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 17/02/2023.
//

import SwiftUI

struct ColorSliderView: View {

    @State var red: Double = 127.5
    @State var green: Double = 127.5
    @State var blue: Double = 127.5

    var body: some View {
        VStack {
            Color(red: red / 255, green: green / 255, blue: blue / 255)
                .clipShape(Circle())
                .frame(width: .infinity, height: 400)
                .padding()
            
            SliderView(value: $red, name: "Red")
            SliderView(value: $green, name: "Green")
            SliderView(value: $blue, name: "Blue")
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView()
    }
}
