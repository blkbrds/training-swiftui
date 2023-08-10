//
//  Cocktail.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 01/06/2023.
//

import Foundation

struct Cocktail: Codable {
    var drinks: [Drink]
}

struct Drink: Codable, Equatable {
    var idDrink: String
    var name: String
    var image: String

    enum CodingKeys: String, CodingKey {
        case idDrink
        case name = "strDrink"
        case image = "strDrinkThumb"
    }
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.idDrink == rhs.idDrink && lhs.name == rhs.name && lhs.image == rhs.image
    }
}
