//
//  ProfileBaiTap2App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/5/23.
//

import SwiftUI

struct ProfileApp: View {
    
    var listName = ["Jack", "Coman", "Messi", "Ronaldo", "Magurie", "Pogba", "Mac", "Mbappe", "Kevin"]
    
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { i in
                HStack {
                    ProfileView(height: CGFloat(100 + i * 10), width: CGFloat(100 + i * 10), indexView: (i == 0 ? i : i * 3), name: (i == 0 ? listName[i] : listName[i * 3]))
                    ProfileView(height: CGFloat(100 + i * 10), width: CGFloat(100 + i * 10), indexView: (i == 0 ? i + 1 : i * 3 + 1), name: (i == 0 ? listName[i + 1] : listName[i * 3 + 1]))
                    ProfileView(height: CGFloat(100 + i * 10), width: CGFloat(100 + i * 10), indexView: (i == 0 ? i + 2 : i * 3 + 2), name: (i == 0 ? listName[i + 2] : listName[i * 3 + 2]))
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct ProfileApp_Previews: PreviewProvider {
    static var previews: some View {
        ProfileApp()
    }
}

struct ProfileView: View {
    
    var height: CGFloat
    var width: CGFloat
    var indexView: Int
    var name: String
    
    var body: some View {
        VStack {
            Image(name)
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(0)
                .frame(width: width, height: height)
                .onTapGesture {
                    print("Index View : \(indexView)" )
                }
            Text(name)
                .foregroundColor(.pink)
                .font(.body)
                .fontWeight(.bold)
        }
        .position(x: 60, y: 70)
    }
}
