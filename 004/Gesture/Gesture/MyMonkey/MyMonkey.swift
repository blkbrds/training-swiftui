//
//  MyMonkey.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 02/03/2023.
//

import SwiftUI

struct MyMonkey: View {

    @State private var scale = 1.0
    @State private var lastScale = 1.0
    @State private var rotation: Angle = .zero
    @State private var isShowMessage: Bool = false
    @State private var contentText: String = ""
    @State private var tapCount = 0
    @State private var timer: Timer?
    @State private var tempCount = 0

    fileprivate func hideMessage() {
        timer = Timer.scheduledTimer(withTimeInterval: 4.7, repeats: false) { _ in
            withAnimation {
                isShowMessage = false
            }
        }
    }

    fileprivate func handleTap(count: Int, content: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            if tapCount == count {
                if !isShowMessage {
                    isShowMessage = true
                }
                contentText = content
                tapCount = 0
                hideMessage()
            }
        }
    }

    var body: some View {

        let magnificationGesture = MagnificationGesture()
            .onChanged { newValue in // newValue là tỉ lệ scale so với kích thước ban đầu
            switch newValue {
            case ..<0.5:
                scale = 0.5
            case 0.5...2.0:
                scale = newValue
            default:
                scale = 2.0
            }
        }

        // state là tỉ lệ tăng giảm so với lần scale trước

//            .onChanged { state in
//            let delta = state / lastScale
//            switch scale * delta {
//            case ..<0.5:
//                scale = 0.5
//            case 0.5...2.0:
//                scale *= delta
//            default:
//                scale = 2.0
//            }
//            lastScale = state
//        }
//            .onEnded { state in
//            lastScale = 1.0
//        }

        let rotationGesture = RotationGesture()
            .onChanged { value in
            rotation = value
        }

        let longPressGesture = LongPressGesture(minimumDuration: 5.0)
            .onEnded { _ in
            scale = 1.0
            rotation = .zero
        }

        let tapGesture = TapGesture()
            .onEnded {
            tapCount += 1
            switch tapCount {
            case 1:
                handleTap(count: tapCount, content: "I am Monkey")
            case 2:
                handleTap(count: tapCount, content: "Monkey is me")
            default:
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
                    if tapCount == tempCount {
                        tapCount = 0
                        hideMessage()
                    }
                }
               tempCount = tapCount
            }
        }

        VStack {
            Image("monkey")
                .resizable()
                .frame(width: 250, height: 250)
                .mask(Circle())
                .rotationEffect(rotation)
                .scaleEffect(scale)
                .position(x: UIScreen.main.bounds.width / 2, y: 300)
                .simultaneousGesture(magnificationGesture)
                .simultaneousGesture(rotationGesture)
                .simultaneousGesture(longPressGesture)
                .simultaneousGesture(tapGesture)

            if isShowMessage {
                ZStack {
                    Image("message")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.7)

                    Text(contentText)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                    .position(x: UIScreen.main.bounds.width / 2, y: 130)
            }
        }
    }
}

struct MyMonkey_Previews: PreviewProvider {
    static var previews: some View {
        MyMonkey()
    }
}
