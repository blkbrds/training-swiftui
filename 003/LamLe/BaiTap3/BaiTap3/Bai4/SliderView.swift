//
//  SliderView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct SliderView: View {
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
                    SliderCustomView(color: $red, nameColor: "Red")
                    SliderCustomView(color: $green, nameColor: "Green")
                    SliderCustomView(color: $blue, nameColor: "Blue")
                    Button ("Reset Color") {
                        red = 0
                        blue = 0
                        green = 0
                    }
                }
            }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}

struct SliderCustomView: View {

    @Binding var color: Double
    var nameColor: String

    var body: some View {
            Section {
                Slider(value: $color, in: 0...255)
            } header: {
                Text("\(nameColor) = \(Int(color))")
                    .italic()
                    .foregroundColor(.purple)
        }
    }
}
