//
//  ListAvatarView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct AvatarModel {
    var nameAvatar: String
    var imageAvatar: String
    
    init(nameAvatar: String, imageAvatar: String) {
        self.nameAvatar = nameAvatar
        self.imageAvatar = imageAvatar
    }
}

struct ListAvatarView: View {
    
    var model: [AvatarModel] = [
        AvatarModel(nameAvatar: "Jack 100", imageAvatar: "jack"),
        AvatarModel(nameAvatar: "King Coman", imageAvatar: "coman"),
        AvatarModel(nameAvatar: "Leo Messi", imageAvatar: "M10"),
        AvatarModel(nameAvatar: "7 Ronaldo", imageAvatar: "ronaldo"),
        AvatarModel(nameAvatar: "Harry Magurie", imageAvatar: "magurie"),
        AvatarModel(nameAvatar: "Paul Pogba", imageAvatar: "pogba"),
        AvatarModel(nameAvatar: "Mac Alise", imageAvatar: "mac"),
        AvatarModel(nameAvatar: "Mbappe", imageAvatar: "mbappe"),
        AvatarModel(nameAvatar: "Kevin", imageAvatar: "kevin")
    ]

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { i in
                HStack {
                    ProfileView(
                        indexView: (i == 0 ? i : i * 3), name: (i == 0 ? model[i].nameAvatar : model[i * 3].nameAvatar), image: (i == 0 ? model[i].imageAvatar : model[i * 3].imageAvatar)
                        )
                    ProfileView(
                        indexView: (i == 0 ? i + 1 : i * 3 + 1), name: (i == 0 ? model[i + 1].nameAvatar : model[i * 3 + 1].nameAvatar), image: (i == 0 ? model[i + 1].imageAvatar : model[i * 3 + 1].imageAvatar)
                        )
                    ProfileView(
                        indexView: (i == 0 ? i + 2 : i * 3 + 2), name: (i == 0 ? model[i + 2].nameAvatar : model[i * 3 + 2].nameAvatar), image: (i == 0 ? model[i + 2].imageAvatar : model[i * 3 + 2].imageAvatar)
                        )
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
}

struct ListAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ListAvatarView()
    }
}

struct ProfileView: View {
    var indexView: Int
    var name: String
    var image: String

    var body: some View {
        VStack {
            Image(image)
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(0)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    print("+ Serial Number : \(indexView) \n+ Name : \(name)" )
                }
            Text(name)
                .foregroundColor(.pink)
                .font(.body)
                .fontWeight(.bold)
        }
        .position(x: 60, y: 70)
    }
}
