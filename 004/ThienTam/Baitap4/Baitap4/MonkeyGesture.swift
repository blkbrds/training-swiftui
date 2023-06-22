//
//  MonkeyGesture.swift
//  Baitap4
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 06/06/2023.
//

import SwiftUI

struct MonkeyGesture: View {

    @GestureState private var scale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0
    @State private var currentAmount: Angle = .zero
    @State private var finalAmount: Angle = .zero
    @GestureState private var longPress = false
    @State private var showText = false
    @State private var tapCount = 0
    @State private var timer: Timer?
    @State private var message: String = ""

    var body: some View {

        let scaleGesture = MagnificationGesture()
            .updating($scale) { value, scale, _ in
            scale = value.magnitude
        }
            .onEnded { value in
            let newScale = currentScale * value.magnitude
            if newScale < 0.5 {
                currentScale = 0.5
            } else if newScale > 2.0 {
                currentScale = 2.0
            } else {
                currentScale = newScale
            }
        }

        let rotationGesture = RotationGesture()
            .onChanged { angle in
            currentAmount = angle
        }
            .onEnded { angle in
            finalAmount += currentAmount
            currentAmount = .zero
        }

        let tapGesture = TapGesture(count: 2)
            .onEnded {
            showText = true
            message = "Khỉ là Tâm"
            startTimer()
        }
            .exclusively(before: TapGesture(count: 1)
                .onEnded {
                showText = true
                message = "Tâm là khỉ"
                startTimer()
            })

        VStack {
            if showText {
                Image("bubble")
                    .resizable()
                    .frame(width: 180, height: 90)
                    .overlay(
                    Text(message)
                        .font(.callout)
                )
            }
            Image("monkey")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .scaleEffect(scale * currentScale)
                .rotationEffect(currentAmount + finalAmount)
                .simultaneousGesture(tapGesture)
                .simultaneousGesture(rotationGesture)
                .simultaneousGesture(scaleGesture)
        }
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            withAnimation {
                showText = false
            }
        }
    }
}

struct MonkeyGesture_Previews: PreviewProvider {
    static var previews: some View {
        MonkeyGesture()
    }
}
