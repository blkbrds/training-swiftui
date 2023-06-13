//
//  BaiTap3.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 08/06/2023.
//

import SwiftUI

struct BaiTap3: View {
    let data = (1...100).map { "Item \($0)" }
    let symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    let colors: [Color] = [.yellow, .purple, .green]
    let columns = [
        GridItem(.flexible(minimum: 80), spacing: 8),
        GridItem(.flexible(minimum: 80), spacing: 8),
        GridItem(.flexible(minimum: 80), spacing: 8)
    ]
    let gridItemLayout = [
        GridItem(.fixed(80), spacing: 8),
        GridItem(.fixed(80), spacing: 8),
        GridItem(.fixed(80), spacing: 8)
    ]
    var body: some View {
        require2
    }
    
    var require1: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .foregroundColor(Color.white)
                        .padding(5)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
    
    var require2: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 8) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 80, maxWidth: .infinity, maxHeight: .infinity)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

struct BaiTap3_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap3()
    }
}
