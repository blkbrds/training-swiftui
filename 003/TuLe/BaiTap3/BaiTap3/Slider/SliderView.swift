//
//  SwiftUIView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 17/02/2023.
//

import SwiftUI

struct SliderView: View {

    @Binding var value: Double
    var name: String

    var body: some View {
        VStack {
            Text("\(name): \(Int(value))")
                .padding(.bottom, -10)
            HStack {
                Text("0")
                    .font(.system(size: 20))
                    .padding()
                Slider(value: $value, in: 0...255)
                Text("255")
                    .font(.system(size: 20))
                    .padding()
            }
        }
    }
}
