//
//  GestureMonkeyView.swift
//  BaiTap4
//
//  Created by Lam Le T. [2] VN.Danang on 8/8/23.
//

import SwiftUI

struct GestureMonkeyView: View {
    
    @State var scale = 1.0
    @State var lastScale = 1.0
    private let minScale = 0.5
    private let maxScale = 2.0
    @State var currentAmount = Angle.zero
    @State var finalAmount = Angle.zero
    @State private var showMessage: Bool = false
    @State private var nameOfImageText: String = ""
    @State private var timer: Timer? = nil
    
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { state in
                let delta = state / lastScale
                scale *= delta
                lastScale = scale
            }
            .onEnded { state in
                validateScaleLimit()
                lastScale = 1.0
            }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                currentAmount = angle
            }
            .onEnded { angle in
                finalAmount += currentAmount
                currentAmount = .zero
            }
    }
    
    var longTapGesture: some Gesture {
        LongPressGesture(minimumDuration: 5)
            .onEnded { _ in
                scale = 1.0
                currentAmount = Angle.zero
                finalAmount = Angle.zero
            }
    }
    
    var tapGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                withAnimation {
                    shouldShowMessage(nameMessage: "MonkeyIsMe_img")
                }
            }
            .exclusively(before: TapGesture()
                .onEnded {
                    withAnimation {
                        shouldShowMessage(nameMessage: "IAmMonkey_img")
                    }
                }
            )
    }
    
    func shouldShowMessage(nameMessage: String) {
        timer?.invalidate()
        timer = nil
        showMessage = true
        nameOfImageText = nameMessage
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            showMessage = false
        }
    }
    
    func getMinimunScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    
    func getMaximunScaleAllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleLimit() {
        scale = getMinimunScaleAllowed()
        scale = getMaximunScaleAllowed()
    }
    
    var body: some View {
        let firstGesture = SimultaneousGesture(magnificationGesture, rotationGesture)
        
        GeometryReader { geometry in
            ZStack {
                if showMessage {
                    Image(nameOfImageText)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 6)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
                Image("monkey_img")
                    .resizable()
                    .frame(alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(currentAmount + finalAmount)
                    .scaleEffect(scale)
                // zom out zom in
                //                .gesture(
                //                    magnificationGesture
                //                )
                // xoay vòng tròn
                //                .gesture(
                //                    rotation
                //                 )
                // kết hợp
                    .gesture(firstGesture)
                    .simultaneousGesture(longTapGesture)
                    .simultaneousGesture(tapGesture)
                    .tag("ImageGesture")
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(.gray).opacity(0.7).ignoresSafeArea())
        }
    }
}

struct GestureMonkeyView_Previews: PreviewProvider {
    static var previews: some View {
        GestureMonkeyView()
    }
}
