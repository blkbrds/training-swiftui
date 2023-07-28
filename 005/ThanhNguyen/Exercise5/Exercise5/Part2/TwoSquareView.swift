//
//  TwoSquareView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct TwoSquareView: View {

    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .frame(width: 100, height: 100)
            Spacer()
            Rectangle()
                .frame(width: 100, height: 100)
            Spacer()
        }
    }
}

struct TwoSquareView_Previews: PreviewProvider {
    static var previews: some View {
        TwoSquareView()
    }
}
