//
//  ThreeSliderView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 21/06/2023.
//

import SwiftUI

struct ThreeSliderView: View {

    @State var redSliderValue: Double = 0
    @State var greenSliderValue: Double = 0
    @State var blueSliderValue: Double = 0

    var body: some View {
        VStack(spacing: 2) {
            VStack {
                Spacer()
                    .background(.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color(red: redSliderValue / 255,
                              green: greenSliderValue / 255,
                              blue: blueSliderValue / 255))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: 2) {
                CustomSliderView(type: .red, sliderValue: $redSliderValue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                CustomSliderView(type: .green, sliderValue: $greenSliderValue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                CustomSliderView(type: .blue, sliderValue: $blueSliderValue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.gray)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
