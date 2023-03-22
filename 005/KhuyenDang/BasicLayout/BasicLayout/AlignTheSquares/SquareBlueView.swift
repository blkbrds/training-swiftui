//
//  SquareBlueView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct SquareBlueView: View {

    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .aspectRatio(contentMode: .fit)
    }
}
