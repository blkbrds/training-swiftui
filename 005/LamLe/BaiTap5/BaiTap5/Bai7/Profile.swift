//
//  Profile.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/24/23.
//

import SwiftUI

struct Profile: View {
    
    var tabOptions: [String] = ["PHOTOS", "VIDEOS", "POSTS", "ABOUT"]
    let images = ["husky1", "husky2", "husky3", "husky4", "husky5", "husky6", "husky7", "husky8", "husky9", "husky10", "husky6", "husky1"]
    @State var isSelectedOption: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack {
                        Image("husky_avatar")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 15, opaque: true)
                            .frame(width: geometry.size.width, height: geometry.size.height / 3 + 100)
                            .clipShape(PolygonShape(height: geometry.size.height / 10))
                        Text("Profile")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold, design: .serif))
                            .padding(.top, -(geometry.size.height / 5))
                        ZStack {
                            Image("husky_scream")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(75)
                                .padding(.top, -(geometry.size.height / 6) + 150)
                            Button(action: {
                                print("Show Setting")
                            }, label: {
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 5)
                                    .rotationEffect(.degrees(-90))
                                    .padding(.leading, geometry.size.height / 2 - 80)
                                    .padding(.top, -(geometry.size.height / 3) + 200)
                            })
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 4)
                    }
                    Text("Meka Meka")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(.blue)
                    Text("Love Meat & Meat")
                        .font(.system(size: 20, weight: .medium, design: .serif))
                        .foregroundColor(.gray.opacity(0.8))
                    HStack(spacing: 30.0) {
                        Button(action: {
                            print("Show MESSAGE")
                        }, label: {
                            Text("MESSAGE")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 15, weight: .medium, design: .serif))
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                        .frame(width: 120)
                                )
                        })
                        .frame(width: 120, alignment: .center)
                        Button(action: {
                            print("GO FOLLOW")
                        }, label: {
                            Text("FOLLOW")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium, design: .serif))
                                .padding()
                                .foregroundColor(.black)
                        })
                        .frame(width: 120, alignment: .center)
                        .background(.black)
                        .cornerRadius(25)
                    }
                    HStack(spacing: 30.0) {
                        InfoView(nameInfo: "Followers", number: "777k")
                        InfoView(nameInfo: "Following", number: "123")
                        InfoView(nameInfo: "Followers", number: "456")
                    }
                    .padding(.horizontal, 20.0)
                    LineView(width: geometry.size.width - 40)
                        .padding(.horizontal)
                    HStack {
                        ForEach(0..<tabOptions.count, id: \.self) { index in
                            Button(action: {
                                isSelectedOption = index
                            }, label: {
                                Text(tabOptions[index])
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .foregroundColor(isSelectedOption == index ? .black : .gray)
                                    .font(.system(size: 14, weight: .medium, design: .serif))
                                    .padding()
                            })
                        }
                    }
                    LineView(width: geometry.size.width - 40)
                        .padding(.horizontal)
                    
                    VStack(spacing: 5.0) {
                        ForEach(0...3, id: \.self) { index in
                            HStack(spacing: 5.0) {
                                ForEach(0...2, id: \.self) { i in
                                    Image(index == 0 ? images[i] : images[index * 3 + i])
                                        .resizable()
                                        .padding(.horizontal, 0.0)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width / 3 - 10, height: geometry.size.width / 3)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

struct InfoView: View {
    var nameInfo, number: String
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text(nameInfo)
                .foregroundColor(.gray)
                .font(.system(size: 20, weight: .medium, design: .serif))
            Text(number)
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .medium, design: .serif))
        }
    }
}

struct LineView: View {
    var width: CGFloat
    
    var body: some View {
        VStack() {
            
        }
        .frame(width: width, height: 1)
        .background(.gray.opacity(0.8))
    }
}
