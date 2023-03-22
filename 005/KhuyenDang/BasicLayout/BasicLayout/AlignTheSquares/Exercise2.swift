//
//  Exercise2.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

struct Exercise2: View {

    var body: some View {

        HStack(spacing: 20) {
            SquareBlueView()
            SquareBlueView()
            SquareBlueView()
        }
        .padding([.leading, .trailing], 20)
    }
}

struct Exercise2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise2().previewDevice("iPhone SE (3rd generation)")
    }
}
