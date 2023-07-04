//
//  ListAvatarView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 04/07/2023.
//

import SwiftUI

struct ListAvatarView: View {

    private struct Constants {
        static let spacing: CGFloat = 20
    }

    let avatars: [String] = ["カイドウ1", "カイドウ2", "カイドウ3", "カイドウ4", "カイドウ5", "カイドウ6", "カイドウ7", "カイドウ8", "カイドウ9"]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                LazyVGrid(columns: columns,
                          spacing: Constants.spacing) {
                    ForEach(Array(avatars.enumerated()), id: \.1) { (index, name) in
                        Avatar(
                            name: name,
                            index: index,
                            width: (geo.size.width - Constants.spacing * CGFloat(columns.count)) / CGFloat(columns.count)
                        )
                    }
                }
                Spacer()
            }
        }
    }
}

struct Avatar: View {

    let name: String
    let index: Int
    let width: CGFloat

    var body: some View {
        VStack {
            Image("img_kaido")
                .resizable()
                .frame(width: width, height: width)
                .scaledToFill()
                .cornerRadius(.infinity)
                .onTapGesture {
                    print("Name: -->", name, index)
                }
            Text(name)
                .multilineTextAlignment(.center)
                .font(.system(size: 15,
                              weight: .bold,
                              design: .monospaced))
        }
        .padding()
    }
}

struct ListAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ListAvatarView()
    }
}
