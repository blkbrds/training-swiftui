//
//  SquareView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

// 1 ô vuông cho chính giữa màn hình
struct SquareView: View {
    var body: some View {
        Rectangle()
            .fill(.blue.opacity(0.5))
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
