//
//  VQueryView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 02/08/2023.
//

import SwiftUI

struct VQueryView: View {

    var data: QueryInfo

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.2))
            HStack {
                Image(data.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding([.top, .bottom], 10)
                VStack(alignment: .leading, spacing: 10) {
                    Text(data.title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                    Text(data.subtitle)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 30, height: 6)
                    .foregroundColor(.red.opacity(0.7))
            }
            .padding([.leading, .trailing])
        }
    }
}

struct VQueryView_Previews: PreviewProvider {
    static var previews: some View {
        VQueryView(data: .init(
            color: .green,
            imageName: "img_luffy",
            title: "Abcd",
            subtitle: "abcd"
        ))
        .previewLayout(.fixed(width: 414, height: 80))
        .previewDisplayName("Fixed Size")
    }
}
