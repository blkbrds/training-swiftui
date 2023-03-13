//
//  MyMonkeyVer1.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/03/2023.
//

import SwiftUI

struct MyMonkeyVer1: View {

    @State private var scale = 1.0
    @State private var rotation: Angle = .zero

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

struct MyMonkeyVer1_Previews: PreviewProvider {
    static var previews: some View {
        MyMonkeyVer1()
    }
}
