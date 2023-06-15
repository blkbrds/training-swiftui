//
//  Pixabay.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import Foundation

class Pixabay: Codable {
    
    var hits: [PixabayItem]
}

class PixabayItem: Codable {
    
    var id: Int
    var tags: String
    var image: String
    var views: Int
    var downloads: Int
    var likes: Int
    var comments: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case tags
        case image = "largeImageURL"
        case views
        case downloads
        case likes
        case comments
    }
}
