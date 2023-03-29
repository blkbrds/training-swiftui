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
        GeometryReader { gr in
            let spacing = (gr.size.width - CGFloat(amount) * 50) / CGFloat(amount + 1)
            
            HStack {
                ForEach(0 ..< amount, id:  \.self) { index in
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: 50, height: 50)
                    if index != amount - 1 { Spacer() }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, spacing)
            .ignoresSafeArea(.all)
        }
    }
}
