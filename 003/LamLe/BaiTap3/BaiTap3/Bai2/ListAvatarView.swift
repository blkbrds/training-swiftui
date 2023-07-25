//
//  ListAvatarView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct ListAvatarView: View {
    
    @StateObject var viewModel = ListAvatarVM()

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { i in
                HStack {
                    ProfileView(indexView: (i == 0 ? i : i * 3), name: (i == 0 ? viewModel.listName[i] : viewModel.listName[i * 3]), image: (i == 0 ? viewModel.listImage[i] : viewModel.listImage[i * 3])
                        )
                    ProfileView(indexView: (i == 0 ? i + 1 : i * 3 + 1), name: (i == 0 ? viewModel.listName[i + 1] : viewModel.listName[i * 3 + 1]), image: (i == 0 ? viewModel.listImage[i + 1] : viewModel.listImage[i * 3 + 1])
                        )
                    ProfileView(indexView: (i == 0 ? i + 2 : i * 3 + 2), name: (i == 0 ? viewModel.listName[i + 2] : viewModel.listName[i * 3 + 2]), image: (i == 0 ? viewModel.listImage[i + 2] : viewModel.listImage[i * 3 + 2])
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
