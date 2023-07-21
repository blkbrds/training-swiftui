//
//  FingerInteractionView.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 21/07/2023.
//

import SwiftUI

struct FingerInteractionView: View {

    @State private var scale: CGFloat = 1
    @State private var rotate: Angle = .zero

    var body: some View {
        VStack {
            Image("img_kaido")
                .resizable()
                .frame(width: 300, height: 400)
                .scaleEffect(scale)
                .rotationEffect(rotate)
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
        }
    }
}

struct FingerInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        FingerInteractionView()
    }
}
