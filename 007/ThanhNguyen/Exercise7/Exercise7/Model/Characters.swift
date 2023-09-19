//
//  Characters.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/09/2023.
//

import Foundation

class Characters: Identifiable {
    let headerTitle: String
    let footerTitle: String
    let name: [String]

    init(headerTitle: String, footerTitle: String, name: [String]) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.name = name
    }
}
