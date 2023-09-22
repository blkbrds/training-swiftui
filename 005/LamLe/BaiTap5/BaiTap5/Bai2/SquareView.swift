//
//  SquareView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

struct SquareView: View {
    var widthHeight: CGFloat
    var backgroundColor: Color
    let squareCount: Int // sô hình vuông muốn hiển thị
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: (geometry.size.width - 2 * widthHeight) / CGFloat(squareCount + 2)) {
                ForEach(0..<squareCount) { index in
                    Rectangle()
                        .fill(backgroundColor.opacity(0.6))
                        .frame(width: widthHeight, height: widthHeight, alignment: .center)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(widthHeight: 50, backgroundColor: .blue, squareCount: 5)
    }
}
