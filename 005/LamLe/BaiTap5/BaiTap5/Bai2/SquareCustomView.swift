//
//  SquareCustomView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct SquareCustomView: View {
    var widthHeight: CGFloat
    var backgroundColor: Color
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor.opacity(0.6))
            .frame(width: widthHeight, height: widthHeight)
    }
}

struct SquareCustomView_Previews: PreviewProvider {
    static var previews: some View {
        SquareCustomView(widthHeight: 200, backgroundColor: .blue)
    }
}
