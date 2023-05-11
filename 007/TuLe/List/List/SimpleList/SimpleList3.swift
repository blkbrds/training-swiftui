//
// SimpleList3.swift
// List
//
// Created by Tu Le C. [2] VN.Danang on 25/04/2023.
//

import SwiftUI

struct SimpleList3: View {
    var array: [(imageName: String, title: String, backgroundColor: Color)] = [
        (imageName:"apple", title: "Apple", backgroundColor: .red),
        (imageName: "cherry", title: "Cherry", backgroundColor: .blue),
        (imageName: "mango", title: "Mango", backgroundColor: .green),
        (imageName: "blueberry", title: "Blueberry", backgroundColor: .blue),
        (imageName: "strawberry", title: "Strawberry", backgroundColor: .pink)
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< array.count) { i in
                    FruitRowView(imageName: array[i].imageName, title: array[i].title, backgroundColor: array[i].backgroundColor)
                }
            }
            .navigationTitle("Fruits")
        }
        
    }
}

struct FruitRowView: View {
    var imageName: String
    var title: String
    var backgroundColor: Color
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 90, height: 90)
                .foregroundColor(backgroundColor)
                .overlay {
                    Image(imageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.clear)
                }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 23, weight: .black))
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text")
                    .lineLimit(3)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SimpleList3_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SimpleList3()
    }
}
