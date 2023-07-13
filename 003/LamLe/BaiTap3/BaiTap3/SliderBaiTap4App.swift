//
//  SliderBaiTap4App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/10/23.
//

import SwiftUI

struct SliderBaiTap4App: View {
    
    // TODO: Properties
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    
    var body: some View {
        ZStack {
            Form {
                ZStack {
                    Color(red: red / 255, green: green / 255, blue: blue / 255)
                }
                .frame(height: 200)
                .background()
                SliderView(color: $red, nameColor: "Red")
                SliderView(color: $green, nameColor: "Green")
                SliderView(color: $blue, nameColor: "Blue")
                Button ("Reset Color") {
                    red = 0
                    blue = 0
                    green = 0
                }
            }
        }
    }
}

struct SliderBaiTap4App_Previews: PreviewProvider {
    static var previews: some View {
        SliderBaiTap4App()
    }
}

struct SliderView: View {
    
    @Binding var color: Double
    var nameColor: String = "Red"
    
    var body: some View {
            Section {
                Slider(value: $color, in: 0...255)
            } header: {
                Text("\(nameColor) = \(Int(color))")
        }
    }
}
