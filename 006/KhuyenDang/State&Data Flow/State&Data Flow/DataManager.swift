//
//  DataManager.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import Foundation
import SwiftUI

struct Account {
    var username: String
    var password: String
    var fullname: String
    var age: Int
    var address: String
}

class DataManager {

    var accounts = [
        Account(username: "a", password: "a", fullname: "Đặng Thị Tú Khuyên", age: 18, address: "Quảng Ngãi"),
        Account(username: "user2", password: "password2", fullname: "Đặng Thị Tú Uyên", age: 20, address: "Quảng Nam"),
        Account(username: "user3", password: "password3", fullname: "Đặng Thị Khuyên", age: 22, address: "Quảng Bình")
    ]
}
