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
