//
//  SquaresView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 15/03/2023.
//

import SwiftUI

struct SquaresView: View {

    var amount: Int

    var body: some View {
        HStack(spacing: 40) {
            ForEach(0 ..< amount, id:  \.self) { _ in
                RoundedRectangle(cornerRadius: 0)
                    .aspectRatio(1.0, contentMode: .fit)
            }
        }
        .padding(.horizontal, 40)
        .ignoresSafeArea(.all)
    }
}
