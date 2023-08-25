//
//  Square2View.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

// 2 ô vuông trở lên canh đều nhau ở giữa màn hình
// xoay dọc ngang
struct Square2View: View {
    
    let squareCount = 3 // sô hình vuông muốn hiển thị
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 20.0) {
                ForEach(0..<squareCount) { index in
                    SquareCustomView(widthHeight: (geometry.size.width / CGFloat(squareCount)) - 20, backgroundColor: .blue)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct Square2View_Previews: PreviewProvider {
    static var previews: some View {
        Square2View()
    }
}
