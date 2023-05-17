//
//  User.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import Foundation

class User: Identifiable {

    let id = UUID()
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}
