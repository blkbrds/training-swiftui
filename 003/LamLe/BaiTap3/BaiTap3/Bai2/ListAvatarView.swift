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
    
    var models: [AvatarModel] = AvatarModel.dummyAvatarModels()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 100) {
                ForEach(1...9, id: \.self) { index in
                    ProfileView(indexView: index, name: models[index - 1].nameAvatar, image: models[index - 1].imageAvatar)
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


extension AvatarModel {
    
    static func dummyAvatarModels() -> [AvatarModel] {
        return
        [
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
    }
}
