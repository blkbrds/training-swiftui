//
//  Hero.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 21/09/2023.
//

import Foundation

class Hero: Identifiable, Codable {
    let id: UUID = .init()
    let name: String

    init(name: String) {
        self.name = name
    }

    enum CodingKeys: CodingKey {
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

extension Hero {
    static let heros: [Hero] = [
        .init(name: "Monkey D. Luffy"),
        .init(name: "Roronoa Zoro"),
        .init(name: "Nami"),
        .init(name: "Usopp"),
        .init(name: "Vinsmoke Sanji"),
        .init(name: "Tony Tony Chopper"),
        .init(name: "Nico Robin"),
        .init(name: "Franky"),
        .init(name: "Brook"),
        .init(name: "Jinbe"),
        .init(name: "Portgas D. Ace")
    ]
}
