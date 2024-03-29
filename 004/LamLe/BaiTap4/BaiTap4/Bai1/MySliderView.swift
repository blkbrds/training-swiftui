//
//  MySliderView.swift
//  BaiTap4
//
//  Created by Lam Le T. [2] VN.Danang on 7/19/23.
//

import SwiftUI

struct MySliderView: View {
    
    // TODO: Properties
    @State var sliderHeight: CGFloat = 0
    @State var sliderProgress: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    @State var numberValue: String = "0"
    internal var didAppear: ((Self) -> Void)?
    
    func handleSliderHeightProgress(numberValue : String, heightOfScreen: CGFloat) {
        if let numberValue = NumberFormatter().number(from: numberValue) {
            let numberValue = Int(truncating: numberValue) > 100 ? 100 : (Int(truncating: numberValue) < 0 ? 0 : numberValue)
            sliderProgress = CGFloat(truncating: numberValue) / 100
            sliderHeight = sliderProgress * (heightOfScreen / 2)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 200.0) {
                HStack {
                    Text("Value")
                        .foregroundColor(.white)
                        .font(.system(size: 33, weight: .bold, design: .serif))
                    TextField("", text: $numberValue)
                        .frame(width: 100, height: 50)
                        .cornerRadius(5)
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .border(LinearGradient(
                            colors: [
                                .red,
                                .white
                            ],
                            startPoint: .leading,
                            endPoint: .trailing))
                        .keyboardType(.decimalPad)
                        .tag("numberOfSlider")
                        .onChange(of: numberValue) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if let value = Int(filtered) {
                                if value > 100 {
                                    self.numberValue = "100"
                                } else if value < 0 {
                                    self.numberValue = "0"
                                } else {
                                    self.numberValue = filtered
                                }
                            } else {
                                self.numberValue = ""
                            }
                            handleSliderHeightProgress(numberValue: numberValue, heightOfScreen: geometry.size.height)
                        }
                }
                TriangleSliderView(sliderProgress: $sliderProgress, sliderHeight: $sliderHeight, lastDragValue: $lastDragValue, numberValue: $numberValue, heightOfTriangle: geometry.size.height)
                    .tag("TriangleSlider")
                    .onAppear { self.didAppear?(self) }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color("backGroupSlider").ignoresSafeArea())
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}
