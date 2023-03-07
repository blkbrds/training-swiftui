//
//  MySlider.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/03/2023.
//

import SwiftUI

struct MySlider: View {

    @Binding var value: String
    var heightSlider: CGFloat = 500
    var widthSlider: CGFloat = 40
    var tempHeight: CGFloat {
        return CGFloat(Int(value) ?? 0) * heightSlider / 100
    }

    var body: some View {
        VStack {
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
                        .position(CGPoint(x: 20, y: heightSlider - tempHeight))
                        .gesture(DragGesture().onChanged({ value in
                            switch value.location.y {
                            case ..<0:
                                self.value = "100"
                            case 0...heightSlider:
                                self.value = "\(Int(((heightSlider - value.location.y) * 100 / heightSlider).rounded()))"
                            default:
                                self.value = "0"
                            }
                        }))
                }
            )
                .frame(width: widthSlider, height: heightSlider)
            Spacer()
        }
    }
}
