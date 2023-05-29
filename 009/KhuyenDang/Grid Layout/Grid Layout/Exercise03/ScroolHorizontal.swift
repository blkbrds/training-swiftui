//
//  ScroolHorizontal.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct ScroolHorizontal: View {

    private var gridItem = [GridItem(.fixed(80), spacing: 0),
        GridItem(.fixed(80), spacing: 0),
        GridItem(.fixed(80), spacing: 0)]

    private var images = ["mountain.2", "macbook.and.iphone", "key.radiowaves.forward", "lock.open.rotation", "stroller", "tree", "abs.circle", "mug", "cloud.snow.fill", "snowflake", "suit.club", "suit.diamond", "suit.spade", "suit.heart", "flag.circle", "slowmo", "thermometer.snowflake", "cloud.moon.rain"]

    private var colors: [Color] = [.pink, .cyan, .mint]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItem) {
                ForEach(0...51, id: \.self) {
                    LazyHItem(color: colors[$0 % colors.count], image: images[$0 % images.count])
                }
            }
        }
    }
}

struct LazyHItem: View {
    var color: Color
    var image: String

    var body: some View {
        Image(systemName: image)
            .frame(width: 70, height: 70)
            .font(.system(size: 30))
            .background(color)
            .cornerRadius(10)
    }
}

struct ScroolHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ScroolHorizontal()
    }
}
