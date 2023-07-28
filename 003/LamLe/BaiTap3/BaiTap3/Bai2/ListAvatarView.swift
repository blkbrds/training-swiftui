//
//  ListAvatarView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct ModelListAvatar {
    var listNameAvatar: [String]
    var listImageAvatar: [String]
    
    init(listNameAvatar: [String], listImageAvatar: [String]) {
        self.listNameAvatar = listNameAvatar
        self.listImageAvatar = listImageAvatar
    }
}

struct ListAvatarView: View {

    var model: ModelListAvatar = ModelListAvatar(listNameAvatar: ["Jack 100", "King Coman", "Leo Messi", "7 Ronaldo", "Harry Magurie", "Paul Pogba", "Mac Alise", " Mbappe", "Kevin"], listImageAvatar: ["jack", "coman", "M10", "ronaldo", "magurie", "pogba", "mac", "mbappe", "kevin"])

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { i in
                HStack {
                    ProfileView(indexView: (i == 0 ? i : i * 3), name: (i == 0 ? model.listNameAvatar[i] : model.listNameAvatar[i * 3]), image: (i == 0 ? model.listImageAvatar[i] : model.listImageAvatar[i * 3])
                        )
                    ProfileView(indexView: (i == 0 ? i + 1 : i * 3 + 1), name: (i == 0 ? model.listNameAvatar[i + 1] : model.listNameAvatar[i * 3 + 1]), image: (i == 0 ? model.listImageAvatar[i + 1] : model.listImageAvatar[i * 3 + 1])
                        )
                    ProfileView(indexView: (i == 0 ? i + 2 : i * 3 + 2), name: (i == 0 ? model.listNameAvatar[i + 2] : model.listNameAvatar[i * 3 + 2]), image: (i == 0 ? model.listImageAvatar[i + 2] : model.listImageAvatar[i * 3 + 2])
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
