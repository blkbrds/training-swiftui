//
//  ScrollViewExample.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 01/08/2023.
//

import SwiftUI

struct ScrollViewExample: View {

    @State var searchText: String = ""

    var horizonListData: [QueryInfo] = [
        .init(color: .red.opacity(0.5), imageName: "img_luffy", title: "Strawberry", subtitle: "food"),
        .init(color: .yellow.opacity(0.5), imageName: "img_luffy", title: "Apple", subtitle: "food"),
        .init(color: .green.opacity(0.5), imageName: "img_luffy", title: "Mango", subtitle: "food"),
        .init(color: .black.opacity(0.5), imageName: "img_luffy", title: "Pineapple", subtitle: "food")
    ]

    var verticalListData: [QueryInfo] = [
        .init(color: .clear, imageName: "img_luffy", title: "Henning-olsens slow", subtitle: "Chumed icecream"),
        .init(color: .clear, imageName: "img_luffy", title: "Passion fruit sweet", subtitle: "Chumed icecream"),
        .init(color: .clear, imageName: "img_luffy", title: "Sandwich", subtitle: "Chumed icecream"),
        .init(color: .clear, imageName: "img_luffy", title: "Bread", subtitle: "Chumed icecream"),
        .init(color: .clear, imageName: "img_luffy", title: "Hot dog", subtitle: "Chumed icecream"),
        .init(color: .clear, imageName: "img_luffy", title: "Vegetable", subtitle: "Chumed icecream")
    ]

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 40, height: 25)
                        Spacer()
                        Image("img_luffy")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .cornerRadius(.infinity)
                    }
                    Text("Hi, Luffy")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 35, weight: .black, design: .rounded))
                        .foregroundColor(.black.opacity(0.7))
                    HStack(spacing: 15) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray.opacity(0.15))
                            .frame(height: 50)
                            .overlay {
                                HStack(spacing: 15) {
                                    Image(systemName: "magnifyingglass")
                                    TextField("Search your photos", text: $searchText)
                                }
                                .padding()
                            }
                        Image(systemName: "mic")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .frame(width: 50, height: 50)
                            .background(.red.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Text("My query")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.top, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(Array(horizonListData.enumerated()), id: \.offset) { data in
                                QueryView(data: data.element)
                                    .frame(width: 170, height: 250)
                            }
                        }
                    }
                    HStack {
                        Text("Popular")
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                            .foregroundColor(.black.opacity(0.7))
                        Spacer()
                        Text("view all")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.red.opacity(0.7))
                    }
                    .padding(.top, 10)
                    ForEach(Array(verticalListData.enumerated()), id: \.offset) { data in
                        VQueryView(data: data.element)
                            .frame(height: 80)
                    }
                }
            }
            .padding([.leading, .trailing])
            TabbarView()
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
