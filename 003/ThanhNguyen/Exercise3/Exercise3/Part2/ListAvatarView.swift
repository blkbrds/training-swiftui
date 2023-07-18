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

    struct AvatarInfo {
        @State var name: String
        let imageStr: String
    }

    let avatars: [AvatarInfo] = [
        .init(name: "Kaido", imageStr: "img_kaido"),
        .init(name: "Luffy", imageStr: "img_luffy"),
        .init(name: "Big Mom", imageStr: "img_bigmom"),
        .init(name: "Shank", imageStr: "img_shank"),
        .init(name: "Garp", imageStr: "img_garp"),
        .init(name: "Roger", imageStr: "img_roger"),
        .init(name: "Buggy", imageStr: "img_buggy"),
        .init(name: "Sakazuki", imageStr: "img_akainu"),
        .init(name: "Kuzan", imageStr: "img_kuzan"),
    ]

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            Spacer()
            LazyVGrid(columns: columns,
                      spacing: Constants.spacing) {
                ForEach(Array(avatars.enumerated()), id: \.offset) { info in
                    Avatar(
                        name: info.element.$name,
                        imageStr: info.element.imageStr
                    )
                }
            }
            Spacer()
        }
    }
}

struct Avatar: View {

    @Binding var name: String
    let imageStr: String

    var body: some View {
        VStack {
            Image(imageStr)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .scaledToFit()
                .cornerRadius(.infinity)
                .onTapGesture {
                    print("Name: -->", name)
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
