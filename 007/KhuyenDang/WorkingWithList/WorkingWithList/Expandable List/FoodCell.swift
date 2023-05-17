//
//  FoodCell.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import SwiftUI

struct FoodCell: View {

    var food: MenuItem

    var body: some View {
        HStack() {
            if let uiImage = UIImage(named: food.image ?? "") {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 40)
                    .cornerRadius(5)
                    .padding(.trailing, 5)
            } else {
                Image("fake_image")
                    .resizable()
                    .frame(width: 50, height: 40)
                    .cornerRadius(5)
                    .padding(.trailing, 5)
            }
            Text(food.name)
                .font(.system(size: 20))
        }
    }
}
