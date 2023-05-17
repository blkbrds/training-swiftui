//
//  FoodItem.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/05/2023.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var quantity: String
    var price: Double
}
