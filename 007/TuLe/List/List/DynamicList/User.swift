//
//  User.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 27/04/2023.
//

import Foundation

struct UserInsta: Identifiable {
    
    var id = UUID()
    var name: String
    var nickname: String
    var isFollow: Bool
    var isBlueTick: Bool
    var imageName: String
    
    static func dummyData() -> [UserInsta] {
        return [
            UserInsta(name: "Victor Lindelof", nickname: "victorlindelof", isFollow: true, isBlueTick: true, imageName: "lindelof"),
            UserInsta(name: "Premier League", nickname: "premierleague", isFollow: true, isBlueTick: true, imageName: "premierLeague"),
            UserInsta(name: "Jadon Sancho", nickname: "sanchooo10", isFollow: true, isBlueTick: true, imageName: "sancho"),
            UserInsta(name: "Cristiano Ronaldo", nickname: "cristiano", isFollow: true, isBlueTick: true, imageName: "ronaldo"),
            UserInsta(name: "UEFA Champions Leaguea", nickname: "championsleague", isFollow: true, isBlueTick: true, imageName: "c1"),
            UserInsta(name: "David De Gea", nickname: "d_degeaofficial", isFollow: true, isBlueTick: true, imageName: "degea"),
            UserInsta(name: "Kevin De Bruyne", nickname: "kevindebruyne", isFollow: true, isBlueTick: true, imageName: "deBruyne")
        ]
    }
}
