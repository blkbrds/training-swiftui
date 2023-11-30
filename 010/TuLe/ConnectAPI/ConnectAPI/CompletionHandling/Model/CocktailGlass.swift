//
//  CocktailGlass.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 29/06/2023.
//

import Foundation

struct CocktailGlass: Codable {
    let cocktail: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktail = "drinks"
    }
}

struct Cocktail: Codable, Hashable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
    
    enum CodingKeys: String, CodingKey {
        case strDrink = "strDrink"
        case strDrinkThumb = "strDrinkThumb"
        case idDrink = "idDrink"
    }
}
