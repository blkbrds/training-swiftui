//
//  FixedGrid.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/05/2023.
//

import SwiftUI

struct FixedGrid: View {

    private var images = ["img0", "img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9"]
//    ** Yêu cầu 1
//    var gridItems = [GridItem(.fixed(100), spacing: 10),
//        GridItem(.fixed(100), spacing: 10),
//        GridItem(.fixed(100), spacing: 10)]
//    ** Yêu cầu 2
    var gridItems = [GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10)]

    var body: some View {
//        ** Yêu cầu 1
//        ScrollView(.vertical, showsIndicators: false) {
//        ** Yêu cầu 2
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
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

struct FixedGrid_Previews: PreviewProvider {
    static var previews: some View {
        FixedGrid()
    }
}
