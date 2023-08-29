//
//  TwoSquareView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/29/23.
//

import SwiftUI

struct TwoSquareView: View {
    var body: some View {
        SquareView(widthHeight: 50, backgroundColor: .blue, squareCount: 2)
    }
}

struct TwoSquareView_Previews: PreviewProvider {
    static var previews: some View {
        TwoSquareView()
    }
}
