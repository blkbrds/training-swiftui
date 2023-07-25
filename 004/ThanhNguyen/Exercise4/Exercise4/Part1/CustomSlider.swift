//
//  CustomSlider.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/07/2023.
//

import SwiftUI

struct CustomSlider: View {

    @Binding var value: Int
    private let sliderHeight: CGFloat = 300
    private let sliderWidth: CGFloat = 30
    var tempHeight: CGFloat {
        return CGFloat(value) * sliderHeight / 100
    }

    var body: some View {
        VStack {
            Triangle(.up, .gray)
                .overlay(
                    ZStack {
                        Triangle(.up, .brown)
                            .frame(width: tempHeight / 10, height: tempHeight)
                            .position(CGPoint(x: sliderWidth / 2,
                                              y: sliderHeight - tempHeight + tempHeight / 2))
                        RoundedRectangle(cornerRadius: .infinity)
                            .fill(.primary)
                            .frame(width: 60,
                                   height: 30)
                            .overlay(
                                Text("\(value)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .heavy, design: .monospaced))
                            )
                            .position(CGPoint(x: sliderWidth / 2,
                                              y: sliderHeight - tempHeight))
                            .gesture(DragGesture().onChanged { value in
                                switch value.location.y {
                                case ..<0:
                                    self.value = 100
                                case 0...sliderHeight:
                                    self.value = Int(((sliderHeight - value.location.y) * 100 / sliderHeight).rounded())
                                default:
                                    self.value = 0
                                }
                            })
                    }
                )
                .frame(width: sliderWidth, height: sliderHeight)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(50))
    }
}
