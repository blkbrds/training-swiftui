//
//  Person.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import Foundation

enum Job: String {
    case navy = "Navy"
    case pirate = "Pirate"
}

class Person: Identifiable {
    let name: String
    let imageName: String
    let job: Job

    init(name: String, imageName: String, job: Job) {
        self.name = name
        self.imageName = imageName
        self.job = job
    }
}

extension Person {
    static let persons: [Person] = [
        .init(name: "Luffy", imageName: "img_luffy_g5", job: .pirate),
        .init(name: "Ace", imageName: "img_ace1", job: .pirate),
        .init(name: "Garp", imageName: "img_garp1", job: .navy),
        .init(name: "Luffy1", imageName: "img_luffy1", job: .pirate),
        .init(name: "Luffy2", imageName: "img_luffy2", job: .pirate),
        .init(name: "Luffy3", imageName: "img_luffy3", job: .navy),
        .init(name: "Luffy4", imageName: "img_luffy4", job: .pirate),
        .init(name: "Luffy5", imageName: "img_luffy5", job: .navy),
        .init(name: "Luffy6", imageName: "img_luffy6", job: .pirate)
    ]
}
