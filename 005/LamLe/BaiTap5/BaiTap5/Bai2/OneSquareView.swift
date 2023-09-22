//
//  OneSquareView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

struct OneSquareView: View {
    
    var body: some View {
        SquareView(widthHeight: 100, backgroundColor: .blue, squareCount: 1)
    }
}

struct OneSquareView_Previews: PreviewProvider {
    static var previews: some View {
        OneSquareView()
    }
}
