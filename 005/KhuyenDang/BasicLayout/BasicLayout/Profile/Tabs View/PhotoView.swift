//
//  PhotoView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/03/2023.
//

import SwiftUI

struct PhotoView: View {
    var images = ["1", "2", "3", "4", "5", "2", "1", "5", "4", "1", "3", "2"]

    var body: some View {
        let width = (UIScreen.main.bounds.width - 10 * 2) / 3
        VStack {
            ForEach(0..<4) { i in
                HStack(spacing: 10) {
                    Image(images[i * 3])
                        .resizable()
                        .frame(width: width, height: width)
                        .scaledToFill()
                    Image(images[i * 3 + 1])
                        .resizable()
                        .frame(width: width, height: width)
                        .scaledToFill()
                    Image(images[i * 3 + 2])
                        .resizable()
                        .frame(width: width, height: width)
                        .scaledToFill()
                }
            }
        }
    }
}
