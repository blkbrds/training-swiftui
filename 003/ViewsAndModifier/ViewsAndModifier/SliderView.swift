//
//  SliderView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 20/02/2023.
//

import SwiftUI

struct SliderView: View {

    @State var red: Double = 255
    @State var green: Double = 123
    @State var blue: Double = 255

    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
                .mask(Circle())
                .shadow(radius: 5)

            VStack(spacing: 20) {
                HStack {
                    Text("Red(\(Int(red)))").font(.system(size: 20))
                        .padding(.leading)
                        .frame(width: 120)
                    Slider(value: $red, in: 0...255, step: 1)
                        .padding(.trailing, 20)
                }
                HStack {
                    Text("Green(\(Int(green)))").font(.system(size: 20))
                        .padding(.leading)
                        .frame(width: 120)
                    Slider(value: $green, in: 0...255, step: 1)
                        .padding(.trailing, 20)
                }
                HStack {
                    Text("Blue(\(Int(blue)))").font(.system(size: 20))
                        .padding(.leading)
                        .frame(width: 120)
                    Slider(value: $blue, in: 0...255, step: 1.0)
                        .padding(.trailing, 20)
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
