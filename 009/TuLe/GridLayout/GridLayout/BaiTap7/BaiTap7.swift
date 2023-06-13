//
//  BaiTap7.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 12/06/2023.
//

import SwiftUI

struct BaiTap7: View {
    
    let sampleCafes: [Anime] = {
        
        var cafes = (1...7).map { Anime(image: "dragonBall\($0)") }
        
        for index in cafes.indices {
            let randomNumber = Int.random(in: (1...7))
            cafes[index].coffeePhotos = (1...randomNumber).map { Photo(name: "dragonBall\($0)") }
        }
        
        return cafes
    }()
    @State var gridLayout: [GridItem] = [ GridItem() ] {
        didSet {
            switch gridLayout.count {
            case 1:
                icon = "rectangle.grid.2x2"
            case 2:
                icon = "rectangle.grid.3x2"
            case 3:
                icon = "square.grid.4x3.fill"
            case 4:
                icon = "rectangle.grid.1x2"
            default:
                icon = "rectangle.grid.1x2"
            }
        }
    }
    @State var icon: String = "rectangle.grid.2x2"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {

                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
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
                        .animation(.easeIn, value: gridLayout.count)
                    }

                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    } label: {
                        Image(systemName: icon)
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("Coffee Feed")
        }
    }
}

struct BaiTap7_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap7()
    }
}

struct Anime: Identifiable {
    var id = UUID()
    var image: String
    var coffeePhotos: [Photo] = []
}
