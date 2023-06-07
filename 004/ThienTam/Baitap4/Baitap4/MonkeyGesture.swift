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

        let doubleTapGesture = TapGesture(count: 2)
            .onEnded {
            tapCount += 1
            showText.toggle()
        }

        let tapGesture = TapGesture(count: 1)
            .onEnded {
            tapCount = 0
            showText.toggle()
        }

        VStack {
            if showText {
                tapCount % 2 == 0
                    ?
                Text("Tôi là khỉ")
                    .font(.largeTitle)
                :
                    Text("Khỉ là tôi")
                    .font(.largeTitle)
            }
            Image("monkey")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .scaleEffect(scale * currentScale)
                .rotationEffect(currentAmount + finalAmount)
                .simultaneousGesture(doubleTapGesture)
                .simultaneousGesture(tapGesture)
                .simultaneousGesture(rotationGesture)
                .simultaneousGesture(scaleGesture)
        }
            .onChange(of: showText) { newValue in
            if newValue {
                startTimer()
            } else {
                cancelTimer()
            }
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            showText = false
        }
    }

    private func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    private func resetState() {
        showText = false
        currentScale = 1.0
        currentAmount = .zero
        finalAmount = .zero
    }

    func hideText() {
        showText = false
    }
}

struct MonkeyGesture_Previews: PreviewProvider {
    static var previews: some View {
        MonkeyGesture()
    }
}
