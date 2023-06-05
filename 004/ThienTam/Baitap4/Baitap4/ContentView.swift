//
//  ContentView.swift
//  Baitap4
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 01/06/2023.
//





import SwiftUI

import SwiftUI

struct CustomSliderView: View {
    @State private var sliderValue: CGFloat = 0

    var body: some View {
        VStack(spacing: 50) {
            Text("\(Int(sliderValue + 20.0))")

            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 20, height: 300)
                    .foregroundColor(Color.red)
                
                Rectangle()
                    .frame(width: 20, height: sliderValue)
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
