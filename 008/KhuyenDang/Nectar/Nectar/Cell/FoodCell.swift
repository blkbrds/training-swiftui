//
//  FoodCell.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/05/2023.
//

import SwiftUI

struct FoodCell: View {

    var foodItem: FoodItem

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: foodItem.image)) { image in
                image
                    .resizable()
                    .frame(height: Define.heightFoodCell * 2 / 5)
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.1)
                    .frame(height: Define.heightFoodCell * 2 / 5)
            }
            VStack(spacing: 5) {
                HStack {
                    Text(foodItem.name)
                        .font(.system(size: 16, weight: .bold))
                        .lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text(foodItem.quantity)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
                .padding(.leading)
            HStack {
                Text("$" + String(format: "%.2f", foodItem.price))
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Button(action: { },
                    label: {
                        Text("+")
                            .frame(width: Define.widthAddButton, height: Define.widthAddButton)
                            .myButtonModifier()
                    })
            }
                .padding(.horizontal)
        }
            .frame(width: Define.widthFoodCell)
            .padding(.bottom, 5)
            .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color("light_gray"), lineWidth: 2)
        )
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

struct FoodCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodCell(foodItem: FoodItem(name: "Táo", image: "https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "1 quả", price: 0.5))
    }
}
