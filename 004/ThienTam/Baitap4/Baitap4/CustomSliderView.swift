//
//  ContentView.swift
//  Baitap4
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 01/06/2023.
//


import SwiftUI

struct CustomSliderView: View {
    @State private var sliderValue: CGFloat = 150
    @State private var textFieldValue: String = ""
    private var transformedSliderValue: String {
        let transformedValue = (sliderValue + 20) / 3
        return String(format: "%.2f", transformedValue)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack(alignment: .center) {
                Text("Slider Value:")
                TextField("", text: $textFieldValue, onEditingChanged: { editing in
                    if !editing, let value = Double(textFieldValue) {
                        sliderValue = CGFloat(value * 3 - 20)
                    }
                })
                    .frame(width: 70)
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(.black)
            }
                .frame(width: 300, height: 50)

            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 20, height: 300)
                    .foregroundColor(Color.red)

                Rectangle()
                    .frame(width: 20, height: sliderValue + 20)
                    .foregroundColor(Color.blue)

                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.yellow)
                    .offset(y: sliderValue)
                    .gesture(
                    DragGesture()
                        .onChanged { value in
                        let offsetY = value.location.y
                        sliderValue = max(-20, min(offsetY, 280))
                        textFieldValue = String(format: "%.2f", (sliderValue + 20) / 3)
                    }
                )
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        CustomSliderView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
