//
//  Animal.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/06/2023.
//

import Foundation

struct Animal: Codable {
    var name: String
    var imageId: String?
    var lifeCycle: String
    var origin: String?
    var breed: String?
    var detail: DetailAnimal?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageId = "reference_image_id"
        case lifeCycle = "life_span"
        case origin
        case breed = "bred_for"
        case detail
    }
}

struct DetailAnimal: Codable {
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case image = "url"
    }
}
