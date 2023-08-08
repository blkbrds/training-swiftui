//
//  TriangleSliderView.swift
//  BaiTap4
//
//  Created by Lam Le T. [2] VN.Danang on 8/8/23.
//
import SwiftUI

struct TriangleSliderView: View {
    
    // TODO: Properties
    @Binding var sliderProgress: CGFloat
    @Binding var sliderHeight: CGFloat
    @Binding var sliderWidth: CGFloat
    @Binding var lastDragValue: CGFloat
    @Binding var numberValue: String
    var heightOfTriangle: CGFloat
    
    func dragOnchange(translation: CGSize) {
        sliderHeight = -translation.height + lastDragValue
        sliderHeight = sliderHeight > heightOfTriangle / 2 ? heightOfTriangle / 2 : sliderHeight
        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
        sliderProgress = sliderHeight / (heightOfTriangle / 2)
        sliderWidth = sliderProgress * 100
        numberValue = "\(Int(sliderProgress * 100))"
    }
    
    func dragOnEnd() {
        sliderHeight = sliderHeight > heightOfTriangle / 2 ? heightOfTriangle / 2 : sliderHeight
        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
        sliderWidth = sliderProgress * 100
        lastDragValue = sliderHeight
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Triangle()
                .fill(Color("slider"))
                .frame(width: 100)
            
            Triangle()
                .fill(Color("progressSlider"))
                .frame(width: sliderWidth, height: sliderHeight)
        }
        .frame(width: 100, height: heightOfTriangle / 2)
        .overlay(
            Text("\(Int(sliderProgress * 100)) %")
                .frame(width: 100, height: 40)
                .background(.white)
                .padding(2)
                .offset(y: -sliderHeight + heightOfTriangle / 4 - 25)
                .tag("process")
                .gesture(DragGesture(minimumDistance: 0).onChanged({(value) in
                    dragOnchange(translation: value.translation)
                }).onEnded( { value in
                    dragOnEnd()
                }))
        )
    }
}
