//
//  MySliderView.swift
//  BaiTap4
//
//  Created by Tu Le C. [2] VN.Danang on 27/02/2023.
//

import SwiftUI

struct MySliderView: View {
    
    @State var valueSlider: Double = 0
    
    var body: some View {
        VStack {
            InputView(valueSlider: $valueSlider)
                .frame(width: .infinity)
            Spacer()
            SliderView(value: $valueSlider)
                .frame(width:40, height:350)
            Spacer()
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.width * 0.8
            let radius = gr.size.width * 0.5
            let heightGR = gr.size.height / 2
            let yOffSet = heightGR - (value / 100) * gr.size.height
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(.green)
                    .offset(y: (heightGR + yOffSet) / 2)
                    .frame(width: gr.size.width, height: (value / 100) * gr.size.height)
                Circle()
                    .foregroundColor(Color.red)
                    .frame(width: thumbSize, height: thumbSize)
                    .offset(y: yOffSet)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { v in
                                if v.location.y < -heightGR {
                                    self.value = 100
                                } else if v.location.y > heightGR {
                                    self.value = 0
                                }
                                else {
                                    self.value = ((heightGR - v.location.y) / gr.size.height) * 100
                                }
                                
                            }
                    )
                    .overlay {
                        Text("\(Int(value))")
                            .offset(y: yOffSet)
                            .foregroundColor(.white)
                    }
            }
        }
    }
}

struct InputView: View {

    @Binding var valueSlider: Double
    
    var body: some View {
        HStack {
            Spacer()
            Text("Value")
            TextField("", value: $valueSlider, formatter: NumberFormatter())
                .frame(width: 150)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green ,lineWidth: 2)
                }
        }
        .padding()
    }
}

