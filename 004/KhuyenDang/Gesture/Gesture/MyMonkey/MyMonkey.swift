//
//  MyMonkey.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 02/03/2023.
//

import SwiftUI

struct MyMonkey: View {

    @State private var isShowMessage: Bool = false
    @State private var contentText: String = ""
    @State private var timer: Timer?

    fileprivate func hideMessage() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            withAnimation {
                isShowMessage = false
            }
        }
    }

    fileprivate func handleTap(content: String) {
        isShowMessage = true
        contentText = content
        hideMessage()
    }

    var body: some View {

        let tapGesture = TapGesture(count: 2)
            .onEnded {
            handleTap(content: "Monkey is me")
        }
            .exclusively(before: TapGesture(count: 1)
                .onEnded {
                handleTap(content: "I am Monkey")
            })

        GeometryReader { geo in
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
                    .offset(y: 120)
            }

            Image("monkey")
                .resizable()
                .frame(width: 250, height: 250)
                .mask(Circle())
                .simultaneousGesture(tapGesture)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
    }
}

struct MyMonkey_Previews: PreviewProvider {
    static var previews: some View {
        MyMonkey()
    }
}
