//
//  MenuItem.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import Foundation

class MenuItem: Identifiable {

    var imageName: String
    var title: String
    var subItems: [MenuItem]?

    init(imageName: String, title: String, subItems: [MenuItem]? = nil) {
        self.imageName = imageName
        self.title = title
        self.subItems = subItems
    }
}
