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

    var body: some View {

        let magnificationGesture = MagnificationGesture()
            .onChanged { state in
            let delta = state / lastScale
            switch scale * delta {
            case ..<0.5:
                scale = 0.5
            case 0.5...2.0:
                scale *= delta
            default:
                scale = 2.0
            }
            lastScale = state
        }
            .onEnded { state in
            lastScale = 1.0
        }

        let rotationGesture = RotationGesture()
            .onChanged { value in
            rotation = value
        }

        let longPressGesture = LongPressGesture(minimumDuration: 5.0)
            .onEnded { _ in
            scale = 1.0
            rotation = .zero
        }

        Image("monkey")
            .resizable()
            .frame(width: 250, height: 250)
            .mask(Circle())
            .rotationEffect(rotation)
            .scaleEffect(scale)
            .simultaneousGesture(magnificationGesture)
            .simultaneousGesture(rotationGesture)
            .simultaneousGesture(longPressGesture)
    }
}

struct MyMonkey_Previews: PreviewProvider {
    static var previews: some View {
        MyMonkey()
    }
}
