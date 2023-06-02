//
//  AdaptiveGrid.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/05/2023.
//

import SwiftUI

struct AdaptiveGrid: View {

    private var images = ["img0", "img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9"]
    var gridItems = [GridItem(.adaptive(minimum: 50), spacing: 10)]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(0...70, id: \.self) {
                    Image(images[$0 % images.count])
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                }
            }
                .padding(.horizontal, 10)
        }
    }
}

struct AdaptiveGrid_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveGrid()
    }
}
