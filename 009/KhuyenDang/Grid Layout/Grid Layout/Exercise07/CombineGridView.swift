//
//  CombineGridView.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 30/05/2023.
//

import SwiftUI

struct CombineGridView: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    let dummyCafes: [Cafe] = {
        var cafes = (1...10).map { Cafe(image: "cafe-\($0)") }

        for index in cafes.indices {
            let randomNumber = Int.random(in: (2...9))
            cafes[index].coffeePhotos = (1...randomNumber).map { Photo(name: "coffee-\($0)") }
        }
        return cafes
    }()
    @State var iconButton: String = "square.grid.2x2"
    @State var gridItem = [GridItem()]
    @State var isShowAdditionalGrid: Bool = false
    @State var itemRegular: Int = 1 // Khi bắt đầu xoay && có 1 item trên 1 hàng ==> 1 hoặc có 2 item ==> 2

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItem, alignment: .center, spacing: 10) {
                    ForEach(dummyCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        if isShowAdditionalGrid {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                ForEach(cafe.coffeePhotos) { photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 50)
                                        .cornerRadius(10)
                                }
                            }
                                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                                .animation(.easeIn, value: gridItem.count)
                        }
                    }
                }
                    .padding(.all, 10)
                    .animation(.easeInOut, value: gridItem.count)
            }
                .navigationTitle("Coffee Feed")
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        // Thay đổi grid
                        Button {
                            if gridItem.count == 1 {
                                gridItem = [GridItem(.flexible()), GridItem(.flexible())]
                                iconButton = "rectangle"
                                itemRegular = 2
                            } else {
                                gridItem = [GridItem()]
                                iconButton = "square.grid.2x2"
                                itemRegular = 1
                            }
                        } label: {
                            Image(systemName: iconButton)
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        // Ẩn hiện addition grid
                        Button {
                            isShowAdditionalGrid.toggle()
                        } label: {
                            Image(systemName: "squares.below.rectangle")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
                .animation(.interactiveSpring(), value: gridItem.count)
                .animation(.interactiveSpring(), value: isShowAdditionalGrid)
        }
            .onChange(of: verticalSizeClass) { value in
            if itemRegular == 1 && value == .regular {
                gridItem = [GridItem()]
                return
            }
            gridItem = [GridItem(.flexible()), GridItem(.flexible())]
        }
    }
}

struct CombineGridView_Previews: PreviewProvider {
    static var previews: some View {
        CombineGridView()
    }
}
