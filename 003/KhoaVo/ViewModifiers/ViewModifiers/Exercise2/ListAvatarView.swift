//
//  ListAvatarView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 20/06/2023.
//

import SwiftUI

struct ListAvatarView: View {

    private var itemSpacing: CGFloat = 10
    private var numberOfItemsPerRow: Int = 3
    private var characters: [Character] = [Character(id: 0, avatarName: "img-naruto-1", characterName: "Uchiha Itachi"),
                                           Character(id: 1, avatarName: "img-naruto-2", characterName: "Pain"),
                                           Character(id: 2, avatarName: "img-naruto-3", characterName: "Konan"),
                                           Character(id: 3, avatarName: "img-naruto-4", characterName: "Hoshigaki Kisame"),
                                           Character(id: 4, avatarName: "img-naruto-5", characterName: "Hidan"),
                                           Character(id: 5, avatarName: "img-naruto-6", characterName: "Sasori"),
                                           Character(id: 6, avatarName: "img-naruto-7", characterName: "Kakuzu"),
                                           Character(id: 7, avatarName: "img-naruto-8", characterName: "Deidara"),
                                           Character(id: 8, avatarName: "img-naruto-9", characterName: "Uchiha Obito")]

    var body: some View {
        ZStack {
            Image("img-naruto-background")
                .resizable()
                .opacity(0.9)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ScrollView {
                Spacer(minLength: 85)
                let totalSpacing: CGFloat = itemSpacing * CGFloat((numberOfItemsPerRow + 1))
                let itemWidth: CGFloat = (UIScreen.main.bounds.width - totalSpacing) / CGFloat(numberOfItemsPerRow)
                let numberOfRows: Int = numberOfRows()
                ForEach(0..<numberOfRows) { stackIndex in
                    HStack(spacing: itemSpacing) {
                        ForEach(0..<numberOfItemsPerRow) { itemIndex in
                            let index: Int = itemIndex + stackIndex * numberOfItemsPerRow
                            ZStack {
                                SubAvatarView(imageName: characters[index].avatarName,
                                              index: index,
                                              characterName: characters[index].characterName,
                                              viewWidth: itemWidth,
                                              viewHeight: itemWidth + 50)
                                .onAvatarPress { index in
                                    print("Index of item is \(index)")
                                }
                            }
                            .frame(width: itemWidth, height: itemWidth + 50)
                        }
                    }
                }
            }
            .background(.clear)
        }
        .edgesIgnoringSafeArea(.all)
    }

    func numberOfRows() -> Int {
        if characters.count % numberOfItemsPerRow == 0 {
            return characters.count / numberOfItemsPerRow
        }
        return characters.count / numberOfItemsPerRow + 1
    }
}
