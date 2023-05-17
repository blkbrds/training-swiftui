//
//  SectionFood.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/05/2023.
//

import SwiftUI

struct SectionFood: View {

    var foodItems: [FoodItem]
    var titleSection: String

    var body: some View {
        Section(header: MyHeader(content: titleSection)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(foodItems) { food in
                        FoodCell(foodItem: food)
                    }
                }
                    .padding(.leading, 20)
            }
        }
            .listSectionSeparator(.hidden)
            .padding(.horizontal, -20)
    }
}

struct MyHeader: View {

    var content: String
    var body: some View {
        HStack {
            Text(content)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
            Spacer()
            Text("See all")
                .foregroundColor(Color("green"))
        }
            .padding(.horizontal, 20)
    }
}

struct SectionFood_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
