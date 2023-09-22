//
//  MyMonkeyView.swift
//  Gestures
//
//  Created by Khoa Vo T.A. VN.Danang on 18/07/2023.
//

import SwiftUI

struct TapGestureView: View {

    @State var showingMessage: Bool = false
    @State var displayText: String = ""
    @State var timer: Timer?

    var body: some View {
        GeometryReader { geometryProxy in

            Image("img-sesshomaru")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 240)
                .simultaneousGesture(TapGesture(count: 2)
                    .onEnded {
                        imageTapGesture(text: "Sesshomaru is me")
                    }
                    .exclusively(before: TapGesture(count: 1)
                        .onEnded {
                            imageTapGesture(text: "I am Sesshomaru")
                        })
                )
                .position(x: geometryProxy.size.width / 2,
                          y: geometryProxy.size.height / 2)

            if showingMessage {
                ZStack {
                    Image(systemName: "message.badge.filled.fill")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                        .foregroundColor(.gray)

                    Text(displayText)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .offset(x: 90, y: 80)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }

    private func hideMessage() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                showingMessage = false
            }
        }
    }

    private func imageTapGesture(text: String) {
        withAnimation(.easeInOut(duration: 0.5)) {
            showingMessage = true
        }
        displayText = text
        hideMessage()
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
