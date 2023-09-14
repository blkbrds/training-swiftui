//
//  LoadingView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 30/08/2023.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white.shadow(.drop(radius: 6)))
            .frame(width: 50, height: 50)
            .overlay {
                ProgressView()
                    .scaleEffect(2)
                    .frame(width: 150, height: 150)
            }
    }
}
