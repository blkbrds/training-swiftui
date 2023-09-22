//
//  MySliderView.swift
//  Gestures
//
//  Created by Khoa Vo T.A. VN.Danang on 10/07/2023.
//

import SwiftUI

struct SubSliderView: View {

    @Binding var value: Int

    var sliderSize: CGSize = CGSize(width: 40, height: 400)
    var sliderHeight: CGFloat {
        return CGFloat(value) * sliderSize.height / 100
    }

    var body: some View {
        VStack {
            Triangle()
                .stroke(Color("SliderMainColor"), lineWidth: 1.5)
                .frame(width: sliderSize.width, height: sliderSize.height)
                .rotationEffect(Angle(degrees: 180))
                .overlay(
                    ZStack {
                        Spacer()
                        Triangle()
                            .fill(
                                LinearGradient(colors: [Color("SliderFirstColor"),
                                                        Color("SliderSecondColor")],
                                               startPoint: .bottom,
                                               endPoint: .top)
                            )
                            .frame(width: sliderHeight / 10, height: sliderHeight)
                            .rotationEffect(Angle(degrees: 180))
                            .position(CGPoint(x: sliderSize.width / 2, y: sliderSize.height - sliderHeight + sliderHeight / 2))
                    }
                )
                .overlay(
                    Rectangle().fill(Color("SliderMainColor"))
                        .frame(width: 80, height: 40)
                        .border(.gray, width: 1.5)
                        .overlay(
                            Text(String(value))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        )
                        .position(CGPoint(x: 20, y: sliderSize.height - sliderHeight))
                        .gesture(DragGesture().onChanged({ value in
                            if value.location.y < 0 {
                                self.value = 100
                            } else if value.location.y < sliderSize.height {
                                self.value = Int(((sliderSize.height - value.location.y) * 100 / sliderSize.height).rounded())
                            } else {
                                self.value = 0
                            }
                        }))
                )
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}
