//
//  ScrollCustomView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct ScrollCustomView: View {
    
    @State var searchKey: String = ""
    var favoriteList: [FavoriteListInfo] = FavoriteListInfo.dummyFavoriteListInfo()
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                ScrollView {
                    VStack(spacing: 30.0) {
                        HStack {
                            Button(action: {
                                print("Show List")
                            }
                                   , label: {
                                Image(systemName: "line.horizontal.3.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.brown)
                            })
                            Spacer()
                            Image("husky")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .cornerRadius(40)
                        }
                        .padding(.horizontal, 20.0)
                        Text("Hi, Sir")
                            .foregroundColor(.brown)
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .padding(.leading, -(geometry.size.width / 2 - 20))
                        HStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.gray.opacity(0.3))
                                .frame(width: geometry.size.width - 100, height: 50)
                                .overlay {
                                    HStack(spacing: 15) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.pink)
                                        TextField("Search something ?", text: $searchKey)
                                    }
                                    .padding()
                                }
                            Spacer()
                            Button(action: {
                                print("On Voice")
                            }
                                   , label: {
                                Image("voice")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.brown)
                            })
                        }
                        .padding(.horizontal, 20.0)
                        Text("My Favorite List")
                            .foregroundColor(.pink)
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .padding(.leading, -(geometry.size.width / 2 - 60))
                        ScrollView(.horizontal) {
                            HStack(spacing: 10.0) {
                                ForEach(0..<favoriteList.count) { index in
                                    CustomListVQueryView(imageName: favoriteList[index].imageName, foodName: favoriteList[index].foodName, foodType: favoriteList[index].foodType, backGroupColor: favoriteList[index].backGroupColor)
                                }
                            }
                        }
                        HStack(spacing: 200.0) {
                            Text("Popular")
                                .foregroundColor(.pink)
                                .font(.system(size: 30, weight: .bold, design: .serif))
                            Text("View All")
                                .foregroundColor(.pink)
                                .font(.system(size: 10, weight: .bold, design: .serif))
                        }
                        .frame(width: geometry.size.width)
                        VStack(spacing: 10.0) {
                            ForEach(0..<favoriteList.count) { index in
                                CustomListHQueryView(imageName: favoriteList[index].imageName, foodName: favoriteList[index].foodName, foodType: favoriteList[index].foodType, backGroupColor: favoriteList[index].backGroupColor, width: geometry.size.width - 60, height:  geometry.size.height / 8)
                            }
                        }
                        .padding(.leading, -40.0)
                    }
                }
                TabBarView()
                    .frame(height: 70)
            }
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollCustomView()
    }
}

