//
//  SectionListViewModel.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/09/2023.
//

import Foundation

final class SectionListViewModel: ObservableObject {
    @Published var charactersData: [Characters] = [
        .init(
            headerTitle: "Naruto",
            footerTitle: "Above is a list of famous characters in the Naruto anime",
            name: ["Uzumaki Naruto", "Uchiha Sasuke", "Haruno Sakura", "Hatake Kakashi", "Nara Shikamaru", "Uchiha Itachi", "Senju Hashirama", "Senju Tobirama", "Hizuzen Sarutobi", "Namikaze Minato", "Orochimaru"]
        ),
        .init(
            headerTitle: "Dragon Ball",
            footerTitle: "Above is a list of famous characters in the Dragon Ball anime",
            name: ["Son Goku", "Bulma", "Krillin", "Yamcha", "Piccolo", "Son Gohan", "Vegeta", "Son Goten", "Majin Buu", "Gotenks", "Android"]
        ),
        .init(
            headerTitle: "One Piece",
            footerTitle: "Above is a list of famous characters in the One Piece anime",
            name: ["Monkey D. Luffy", "Roronoa Zoro", "Nami", "Usopp", "Sanji", "Tony Tony Chopper", "Nico Robin", "Franky", "Brook", "Jinbe", "Portgas D. Ace"]
        )
    ]
}
