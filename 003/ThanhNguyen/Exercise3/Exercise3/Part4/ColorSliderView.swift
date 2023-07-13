//
//  ColorSliderView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 05/07/2023.
//

import SwiftUI

struct ColorSliderView: View {

    @State var red: Double = 0
    @State var green: Double = 0
    @State var blue: Double = 0

    var body: some View {
        VStack() {
            Circle()
                .foregroundColor(Color(red: red / 255,
                                       green: green / 255,
                                       blue: blue / 255))
            Spacer()
            SliderView(type: .red, value: $red)
            SliderView(type: .green, value: $green)
            SliderView(type: .blue, value: $blue)
            Spacer()
        }
        .padding()
    }
}

struct SliderView: View {

    enum ColorType: String {
        case red, green, blue

        var color: Color {
            switch self {
            case .red: return .red
            case .green: return .green
            case .blue: return .blue
            }
        }
    }

    let type: ColorType
    let value: Binding<Double>

    var body: some View {
        HStack {
            Text("\(type.rawValue)(\(Int(value.wrappedValue))):")
                .frame(width: 150, alignment: .leading)
                .lineLimit(1)
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .minimumScaleFactor(0.5)
                .foregroundColor(type.color)
            Slider(value: value, in: 0...255, step: 1)
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView()
    }
}
