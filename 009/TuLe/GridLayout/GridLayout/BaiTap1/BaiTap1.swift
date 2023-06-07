//
//  BaiTap1.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 02/06/2023.
//

import SwiftUI

struct BaiTap1: View {

    @State private var colors: [Color] = Array(repeating: .blue, count: 50)
    let columns = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(0..<colors.count) { index in
                    Text("Item \(index + 1)")
                        .foregroundColor(Color.white)
                        .padding(5)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(colors[index])
                        .cornerRadius(12)
                        .onTapGesture {
                            colors = Array(repeating: .blue, count: 50)
                            colors[index] = .red
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
}

struct BaiTap1_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap1()
    }
}
