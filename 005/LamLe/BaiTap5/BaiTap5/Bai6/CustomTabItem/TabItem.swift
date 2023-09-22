//
//  TabItem.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct TabItem: View {
    var width, height: CGFloat
    var nameImage: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.blue.opacity(0.5))
                .frame(width: height, height: height)
            Image(systemName: nameImage)
                .resizable()
                .frame(width: height - 20, height: height - 20)
                .foregroundColor(.white)
        }
        .frame(width: width, height: height)
        .offset(y: 10)
    }
}


