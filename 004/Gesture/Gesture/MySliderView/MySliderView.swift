//
//  MySliderView.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 27/02/2023.
//

import SwiftUI

struct MySliderView: View {

    @State private var value = "0"
    private var heightSlider: CGFloat = 500
    private var widthSlider: CGFloat = 40
    var tempHeight: CGFloat {
        return CGFloat(Int(value) ?? 0) * heightSlider / 100
    }

    var body: some View {

        VStack(spacing: 80) {
            MyTextField(value: $value)

            GeometryReader { reader in
                HStack {
                    Spacer()
                    // red View
                    Rectangle()
                        .foregroundColor(.red)
                        .cornerRadius(5)
                        .overlay(
                        ZStack {
                            Spacer()
                            // blue view
                            Rectangle()
                                .foregroundColor(.blue)
                                .cornerRadius(5)
                                .frame(height: tempHeight)
                                .position(CGPoint(x: widthSlider / 2, y: heightSlider - tempHeight + tempHeight / 2))
                            // yellow view
                            Circle().fill(.yellow)
                                .overlay(
                                Text(value)
                            )
                                .position(CGPoint(x: widthSlider / 2, y: heightSlider - tempHeight))
                                .gesture(DragGesture().onChanged({ value in
                                    guard value.location.y < heightSlider && value.location.y > 0 else {
                                        return
                                    }
                                    self.value = "\(Int(((heightSlider - value.location.y) * 100 / heightSlider).rounded()))"
                                }))
                        }
                    )
                        .frame(width: widthSlider, height: heightSlider)
                    Spacer()
                }
            }
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}
