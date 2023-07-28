//
//  ResizeView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct ResizeView: View {

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Rectangle()
                    .foregroundColor(.green)
                Rectangle()
                    .foregroundColor(.orange)
            }
            .padding([.leading, .trailing, .top], 20)
            Rectangle()
                .padding([.leading, .trailing], 20)
                .foregroundColor(.blue)
        }
    }
}

struct ResizeView_Previews: PreviewProvider {
    static var previews: some View {
        ResizeView()
    }
}
