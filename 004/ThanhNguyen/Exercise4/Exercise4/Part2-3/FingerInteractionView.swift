//
//  FingerInteractionView.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 21/07/2023.
//

import SwiftUI

struct FingerInteractionView: View {

    @State private var shouldShowMessage: Bool = false
    @State private var message: String = ""
    @State private var timer: Timer?
    @State private var scale: CGFloat = 1
    @State private var rotate: Angle = .zero

    var body: some View {
        GeometryReader { geo in
            if shouldShowMessage {
                ZStack {
                    Image("img_message")
                        .resizable()
                        .frame(width: geo.size.width - 50,
                               height: geo.size.width / 2)
                        .scaledToFit()
                    Text(message)
                        .font(.system(size: 30, weight: .heavy, design: .serif))
                }
                .position(x: geo.size.width / 2,
                          y: geo.size.height / 6)
            }
            Image("img_kaido")
                .resizable()
                .frame(width: 150, height: 200)
                .scaleEffect(scale)
                .rotationEffect(rotate)
                .position(x: geo.size.width / 2,
                          y: geo.size.height / 2)
                .padding(.top, 80)
                .simultaneousGesture(MagnificationGesture()
                    .onChanged { newValue in
                        self.scale = min(max(newValue.magnitude, 0.5), 2)
                    }
                )
                .simultaneousGesture(RotationGesture()
                    .onChanged { angle in
                        self.rotate = angle
                    }
                )
                .simultaneousGesture(LongPressGesture(minimumDuration: 5)
                    .onEnded { _ in
                        self.scale = 1
                        self.rotate = .zero
                    }
                )
                .simultaneousGesture(TapGesture(count: 2)
                    .onEnded {
                        interfaceUpdate(message: "Kaido is me")
                    }
                    .exclusively(before: TapGesture()
                        .onEnded {
                            interfaceUpdate(message: "I'm Kaido")
                        }
                    )
                )
        }
    }

    private func interfaceUpdate(message: String) {
        withAnimation {
            shouldShowMessage = true
        }
        self.message = message
        hideMessage()
    }

    private func hideMessage() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            withAnimation {
                shouldShowMessage = false
                timer = nil
            }
        }
    }
}

struct FingerInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        FingerInteractionView()
    }
}
