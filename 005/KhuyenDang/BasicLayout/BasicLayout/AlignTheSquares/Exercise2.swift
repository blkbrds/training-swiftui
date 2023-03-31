//
//  Exercise2.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

struct Exercise2: View {

    var numberOfSquare: Int = 4
    var widthOfSquare: CGFloat = 70
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                let spaceForAll = geo.size.width - (CGFloat(numberOfSquare) * widthOfSquare)
                let space: CGFloat = spaceForAll / CGFloat((2 + numberOfSquare - 1))
                HStack(spacing: space) {
                    ForEach(0 ..< numberOfSquare, id: \.self) { _ in
                        SquareBlueView()
                    }
                }
                .padding([.leading, .trailing], space)
                Spacer()
            }
        }
    }
}

struct Exercise2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise2()
    }
}
