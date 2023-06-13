//
//  TwoSquare.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct TwoSquare: View {
    
    var numberOfSquare: Int = 3
    var widthSquare: CGFloat = 100

    var body: some View {
        GeometryReader { geo in
            let spaceAll = geo.size.width - (CGFloat(numberOfSquare) * widthSquare)
            let spaceBetween = spaceAll / CGFloat((numberOfSquare + 1))
            VStack(alignment: .center) {
                Spacer()
                HStack(spacing: spaceBetween) {
                    ForEach(0 ..< numberOfSquare, id: \.self) { _ in
                        SquareView()
                    }
                }
                .padding([.leading, .trailing], spaceBetween)
                Spacer()
            }
        }
    }
}

struct SquareView: View {
    var body: some View {
        Rectangle()
            .aspectRatio(contentMode: .fit)
    }
}

struct TwoSquare_Previews: PreviewProvider {
    static var previews: some View {
        TwoSquare()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
