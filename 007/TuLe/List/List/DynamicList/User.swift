//
//  Weather.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 27/04/2023.
//

import Foundation

struct Weather: Identifiable {
    
    var id = UUID()
    var name: String
    var nickname: String
    var isFollow: Bool
    var isBlueTick: Bool
    var imageName: String
    
    static func dummyData() -> [Weather] {
        return [
            Weather(name: "Victor Lindelof", nickname: "victorlindelof", isFollow: true, isBlueTick: true, imageName: "lindelof"),
            Weather(name: "Premier League", nickname: "premierleague", isFollow: true, isBlueTick: true, imageName: "premierLeague"),
            Weather(name: "Jadon Sancho", nickname: "sanchooo10", isFollow: true, isBlueTick: true, imageName: "sancho"),
            Weather(name: "Cristiano Ronaldo", nickname: "cristiano", isFollow: true, isBlueTick: true, imageName: "ronaldo"),
            Weather(name: "UEFA Champions Leaguea", nickname: "championsleague", isFollow: true, isBlueTick: true, imageName: "c1"),
            Weather(name: "David De Gea", nickname: "d_degeaofficial", isFollow: true, isBlueTick: true, imageName: "degea"),
            Weather(name: "Kevin De Bruyne", nickname: "kevindebruyne", isFollow: true, isBlueTick: true, imageName: "deBruyne")
        ]
    }
}
