//
//  ProfileScreenView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct ProfileScreenView: View {

    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Image("avatar")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height / 4)
                    .blur(radius: 5)
                    .clipShape(PolygonBackground())
                    .overlay(
                    ZStack {
                        MyAvatar(name: "avatar")
                            .frame(width: 120, height: 120)
                            .offset(x: 0, y: geo.size.height / 16)
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 20, height: 4)
                            .rotationEffect(.degrees(-90))
                            .offset(x: geo.size.width / 2 - 40, y: geo.size.height / 16)
                    }
                )
                    .padding(.bottom, 20)

                MyName(name: "Anna Kendrick")
                MySubName(name: "Vlogger and fashion Lover")
                    .padding(.bottom, 20)
                HStack(spacing: 30) {
                    MyButtonView(type: .message)
                    MyButtonView(type: .follow)
                }
                    .padding(.bottom, 20)
                HStack(spacing: 35) {
                    MyInfoView(name: "Followers", value: "100k")
                    MyInfoView(name: "Following", value: "378")
                    MyInfoView(name: "Posts", value: "115")
                }
                    .padding(.bottom, 20)
                MyTabInfoView()
            }
        }
            .ignoresSafeArea()
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView().previewDevice("iPhone 11")
    }
}
