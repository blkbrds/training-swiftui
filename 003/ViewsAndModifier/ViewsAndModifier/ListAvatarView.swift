//
//  ListAvatarView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 15/02/2023.
//

import Foundation
import SwiftUI

struct ListAvatarView: View {
    let avatars = ["Khuyen1", "Khuyen2", "Khuyen3", "Khuyen4", "Khuyen5", "Khuyen6", "Khuyen7", "Khuyen8", "Khuyen9", "Khuyen10", "Khuyen11"]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let space: CGFloat = 20

    var body: some View {
        let numberOfColumns = columns.count
        let widthForItem = (UIScreen.main.bounds.width - space * CGFloat(numberOfColumns + 1)) / CGFloat(numberOfColumns)
        LazyVGrid(columns: columns, spacing: space) {
            ForEach(Array(avatars.enumerated()), id: \.1) { (index, name) in
                AvatarView1(name: name, index: index, width: widthForItem)
            }
        }
        .padding()
    }
}


struct AvatarView1: View {
    let name: String
    let index: Int
    let width: CGFloat
    
    var body: some View {
        VStack {
            Image("rabbit")
                .resizable()
                .frame(width: width, height: width, alignment: .center)
                .scaledToFill()
                .mask(Circle())
                .onTapGesture {
                    print("Chi so index cua \(name) la \(index)")
                }
                .shadow(radius: 5)

            Text(name)
                .padding()
        }
    }
}
