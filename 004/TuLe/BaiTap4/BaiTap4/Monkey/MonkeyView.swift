//
//  MonkeyView.swift
//  BaiTap4
//
//  Created by Tu Le C. [2] VN.Danang on 05/03/2023.
//

import SwiftUI

struct MonkeyView: View {

    @State var scale: CGFloat = 1
    @State var rotate: Angle = .degrees(0)
    @State var message: String = ""
    @State var count: Int = 0
    @State var isShowView: Bool = false
    @State var timer: Timer?

    var body: some View {
        ZStack {
            Image("8054278")
                .resizable()
                .frame(width: 150, height: 150)
                .scaleEffect(scale)
                .rotationEffect(rotate)
                .simultaneousGesture(
                    RotationGesture()
                        .onChanged { angle in
                            rotate = angle
                        }
                )
                .simultaneousGesture(
                    MagnificationGesture()
                        .onChanged { newScale in
                            scale = newScale
                            if newScale > 2.0 {
                                scale = 2.0
                            }
                            if newScale < 0.5 {
                                scale = 0.5
                            }
                        }
                )
                .simultaneousGesture(
                    TapGesture(count: 2).onEnded {
                        handleTap(mess: "Khỉ là tôi")
                    }.exclusively(before: TapGesture(count: 1).onEnded {
                        handleTap(mess: "Tôi là khỉ")
                    })
                )
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: 5.0)
                        .onEnded { _ in
                            scale = 1
                            rotate = .degrees(0)
                        }
                )

            if isShowView {
                Text(message)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 4)
                    )
                    .offset(y: -120)
                    .transition(.scale)
                
            }
        }
    }
    
    func hiddenMessage() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            withAnimation {
                isShowView = false
            }
        }
    }

    func handleTap(mess: String) {
        timer?.invalidate()
        message = mess
        count = 0
        withAnimation {
            isShowView = true
            hiddenMessage()
        }
    }
}

struct MonkeyView_Previews: PreviewProvider {
    static var previews: some View {
        MonkeyView()
    }
}
