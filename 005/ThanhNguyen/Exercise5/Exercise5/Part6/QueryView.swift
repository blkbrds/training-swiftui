//
//  QueryView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 02/08/2023.
//

import SwiftUI

struct QueryInfo {
    var color: Color
    var imageName: String
    var title: String
    var subtitle: String
}

struct QueryView: View {

    var data: QueryInfo

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(data.color)
            VStack {
                Image(data.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 35)
                Text(data.title)
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(data.color.opacity(1.8))
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                Text(data.subtitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(data.color.opacity(1.7))
                Spacer()
            }
        }
    }
}

struct QueryView_Previews: PreviewProvider {
    static var previews: some View {
        QueryView(data: .init(
            color: .red.opacity(0.5),
            imageName: "img_luffy",
            title: "Strawberry",
            subtitle: "food"
        ))
        .previewLayout(.fixed(width: 200, height: 300))
        .previewDisplayName("Fixed Size")
    }
}
