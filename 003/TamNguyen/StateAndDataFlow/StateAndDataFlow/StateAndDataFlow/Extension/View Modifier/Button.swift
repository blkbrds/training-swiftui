//
//  CommonButton.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 14/05/2023.
//

import SwiftUI

extension Button {
    func commonButton(paddingHorizontal: CGFloat, paddingVertical: CGFloat) -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 50)
            .background(Color(hex: "#4552CB"))
            .bold()
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .padding(.horizontal, paddingHorizontal)
            .padding(.vertical, paddingVertical)
    }
}
