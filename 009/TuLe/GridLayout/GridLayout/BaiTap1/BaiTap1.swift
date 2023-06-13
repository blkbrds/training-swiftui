//
//  BaiTap1.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 02/06/2023.
//

import SwiftUI

struct BaiTap1: View {

    @State private var colors: [Color] = Array(repeating: .blue, count: 50)
    @State private var selectedCell: Int?

    let columns = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(0..<colors.count) { index in
                    ItemCell(data: SelectedCell(title: "Item \(index + 1)", isSelected: index == selectedCell ? true : false))
                        .onTapGesture {
                            selectedCell = index
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

struct ItemCell: View {

    var data: SelectedCell

    var body: some View {
        Text(data.title)
            .foregroundColor(Color.white)
            .padding(5)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(data.isSelected ? .red : .blue)
            .cornerRadius(12)
    }
}

struct SelectedCell {
    var title: String
    var isSelected: Bool
}
