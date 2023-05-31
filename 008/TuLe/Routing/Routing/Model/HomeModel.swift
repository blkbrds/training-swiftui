//
//  HomeModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

struct HomeModel: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case nowPlaying
        case comingSoon
        case topMovies
    }
    
    var id = UUID()
    var nowPlaying: [String]
    var comingSoon: [String]
    var topMovies: [String]
}
