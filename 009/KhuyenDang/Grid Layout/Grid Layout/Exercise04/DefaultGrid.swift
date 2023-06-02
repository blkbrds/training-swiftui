//
//  DefaultGrid.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/05/2023.
//

import SwiftUI

struct DefaultGrid: View {

    private var images = ["img0", "img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9"]

//    ** Yêu cầu 1
//    private var gridItem = [GridItem(), GridItem()]
//    ** Yêu cầu 2
    private var gridItem = [GridItem()]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItem) {
                ForEach(0...19, id: \.self) {
                    Image(images[$0 % images.count])
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                }
            }
                .padding(.horizontal, 10)
        }

    }
}

struct DefaultGrid_Previews: PreviewProvider {
    static var previews: some View {
        DefaultGrid()
    }
}
