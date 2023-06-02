//
//  Cafe.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 31/05/2023.
//

import Foundation

struct Cafe: Identifiable {
    var id = UUID()
    var image: String
    var coffeePhotos: [Photo] = []
}

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}
