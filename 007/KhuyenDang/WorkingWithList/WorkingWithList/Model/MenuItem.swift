//
//  MenuItem.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    var dealImage: String?
    var name: String
    var image: String?
    var subMenuItems: [MenuItem]?
}
