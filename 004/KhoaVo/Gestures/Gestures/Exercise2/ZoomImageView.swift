//
//  ZoomImageView.swift
//  Gestures
//
//  Created by Khoa Vo T.A. VN.Danang on 12/07/2023.
//

import SwiftUI

struct ZoomImageView: View {

    @State var rotationDegree = 0.0
    @State var scale = 1.0

    var body: some View {
        VStack() {
            Image("img-sesshomaru")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 240)
                .shadow(radius: 3)
                .scaleEffect(scale, anchor: .center)
                .simultaneousGesture(MagnificationGesture()
                    .onChanged { scale in
                        self.scale = min(max(scale.magnitude, 0.5), 2.0)
                    }
                )
                .rotationEffect(Angle.degrees(rotationDegree))
                .simultaneousGesture(RotationGesture()
                    .onChanged({ angle in
                        self.rotationDegree = angle.degrees
                    }))
                .simultaneousGesture(LongPressGesture(minimumDuration: 5.0)
                    .onEnded({ _ in
                        scale = 1.0
                        rotationDegree = 0.0
                    })
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
    }
}

struct ZoomImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomImageView()
    }
}
