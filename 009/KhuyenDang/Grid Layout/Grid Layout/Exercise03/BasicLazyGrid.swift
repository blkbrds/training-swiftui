//
//  BasicLazyGrid.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct BasicLazyGrid: View {

    var columns = [GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))]

    var data = Array(1...89)

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(data, id: \.self) { index in
                    LazyItem(index: index)
                }
            }
                .padding(.horizontal, 5)
        }
    }
}

struct LazyItem: View {
    let index: Int
    var body: some View {
        Text("Item \(index)")
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(Color.pink.opacity(0.5))
            .font(.system(size: 18))
    }
}

struct BasicLazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        BasicLazyGrid()
    }
}
