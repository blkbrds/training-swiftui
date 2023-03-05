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

    var body: some View {
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
            .onLongPressGesture(minimumDuration: 5.0) {
                scale = 1
                rotate = .degrees(0)
            }
    }
}

struct MonkeyView_Previews: PreviewProvider {
    static var previews: some View {
        MonkeyView()
    }
}
