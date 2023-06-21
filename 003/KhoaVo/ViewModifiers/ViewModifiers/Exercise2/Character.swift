//
//  Character.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 20/06/2023.
//

import Foundation

final class Character {

    var id: Int
    var avatarName: String
    var characterName: String

    init(id: Int,
         avatarName: String,
         characterName: String) {
        self.id = id
        self.avatarName = avatarName
        self.characterName = characterName
    }
}
