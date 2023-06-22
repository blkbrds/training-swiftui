//
//  CustomSliderView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

enum SliderColorType {
    case red
    case green
    case blue

    var title: String {
        switch self {
        case .red:
            return "Red"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        }
    }

    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
}

struct CustomSliderView: View {

    var type: SliderColorType
    @Binding var sliderValue: Double

    var body: some View {
        HStack {
            let intValue: Int = Int(sliderValue)
            Text("\(type.title) value: \(intValue)")
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(type.color)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Slider(value: $sliderValue,
                      in: 0...255,
                      step: 1) { didChange in
                   // updateBackgroundColor()
               }
                      .tint(type.color)
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer(minLength: 20)
        }
        .background(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
