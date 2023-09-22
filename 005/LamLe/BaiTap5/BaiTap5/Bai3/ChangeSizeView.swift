//
//  ChangeSizeView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct ChangeSizeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20.0) {
                HStack(spacing: 40.0) {
                    Rectangle()
                        .fill(.green.opacity(0.6))
                        .frame(width: geometry.size.width / 2 - 40, height: geometry.size.height / 2 - 100)
                    Rectangle()
                        .fill(.orange.opacity(0.6))
                        .frame(width: geometry.size.width / 2 - 40, height: geometry.size.height / 2 - 100)
                }
                Rectangle()
                    .fill(.blue.opacity(0.5))
                    .frame(width: geometry.size.width - 40, height: geometry.size.height / 2 - 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct ChangeSizeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeSizeView()
    }
}
