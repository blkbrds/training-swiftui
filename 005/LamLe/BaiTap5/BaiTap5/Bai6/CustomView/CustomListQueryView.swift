//
//  CustomListHQueryView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/24/23.
//

import SwiftUI
struct CustomListVQueryView: View {
    var imageName: String
    var foodName: String
    var foodType: String
    var backGroupColor: Color
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(50)
            Text(foodName)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .serif))
            Text(foodType)
                .foregroundColor(.gray)
                .font(.system(size: 20, weight: .medium, design: .serif))
        }
        .frame(width: 150, height: 200)
        .background(backGroupColor)
        .cornerRadius(20)
        .padding(.leading, 20.0)
    }
}

struct CustomListHQueryView: View {
    var imageName: String
    var foodName: String
    var foodType: String
    var backGroupColor: Color
    var width, height: CGFloat
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 50)
                .cornerRadius(10)
                .padding(.leading, 20.0)
            VStack {
                Text(foodName)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .serif))
                Text(foodType)
                    .foregroundColor(.gray)
                    .font(.system(size: 20, weight: .medium, design: .serif))
            }
            Spacer()
            HStack {
                ForEach(0..<3) { _ in
                    Circle()
                        .fill(.pink.opacity(0.7))
                        .frame(width: 5, height: 5)
                }
            }
            .padding(.trailing, 20.0)
        }
        .frame(width: width, height: height)
        .background(backGroupColor)
        .cornerRadius(20)
        .padding(.leading, 20.0)
    }
}

struct FavoriteListInfo {
    var imageName: String
    var foodName: String
    var foodType: String
    var backGroupColor: Color
}

extension FavoriteListInfo {
    static func dummyFavoriteListInfo() -> [FavoriteListInfo] {
        return [
            FavoriteListInfo(imageName: "somTam", foodName: "Som Tam", foodType: "Food", backGroupColor: .pink.opacity(0.5)),
            FavoriteListInfo(imageName: "seaFood", foodName: "Sea Food", foodType: "Food", backGroupColor: .gray.opacity(0.5)),
            FavoriteListInfo(imageName: "banhXeo", foodName: "Bánh Xèo", foodType: "Food", backGroupColor: .yellow.opacity(0.5)),
            FavoriteListInfo(imageName: "milkTea", foodName: "Trà Sữa", foodType: "Drink", backGroupColor: .green.opacity(0.5)),
            FavoriteListInfo(imageName: "thit", foodName: "Thịt Nướng", foodType: "Food", backGroupColor: .blue.opacity(0.5)),
            FavoriteListInfo(imageName: "xien2", foodName: "Xiên Nướng", foodType: "Food", backGroupColor: .brown.opacity(0.5)),
            FavoriteListInfo(imageName: "xienNuong", foodName: "Xiên Nướng", foodType: "Food", backGroupColor: .purple.opacity(0.5)),
            FavoriteListInfo(imageName: "xienNuong", foodName: "Xiên Nướng", foodType: "Food", backGroupColor: .red.opacity(0.5)),
            FavoriteListInfo(imageName: "myQuang", foodName: "Mỳ Quảng", foodType: "Food", backGroupColor: .pink.opacity(0.5)),
        ]
    }
}
