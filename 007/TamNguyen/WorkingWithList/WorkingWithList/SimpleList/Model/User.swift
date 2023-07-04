//
//  User.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 29/06/2023.
//

import Foundation

struct User {
    var imageName: String
    var largeTitle: String
    var smallTitle: String
    
    init(imageName: String, largeTitle: String, smallTitle: String) {
        self.imageName = imageName
        self.largeTitle = largeTitle
        self.smallTitle = smallTitle
    }
}
