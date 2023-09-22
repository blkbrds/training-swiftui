//
//  ThreeSquareView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/29/23.
//

import SwiftUI

struct ThreeSquareView: View {
    var body: some View {
        SquareView(widthHeight: 50, backgroundColor: .blue, squareCount: 3)
    }
}

struct ThreeSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeSquareView()
    }
}
