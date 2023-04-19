//
//  LocalStorage.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import SwiftUI

class LocalStorage {

    @AppStorage("username") var username: String = ""
    @AppStorage("password") var password: String = ""
    @AppStorage("fullname") var fullname: String = ""
    @AppStorage("age") var age: Int = 0
    @AppStorage("address") var address: String = ""

    func setUser(username: String = "", password: String = "", fullname: String, age: Int, address: String) {
        self.username = username
        self.password = password
        self.fullname = fullname
        self.age = age
        self.address = address
    }

    func resetUser() {
        self.fullname = ""
        self.age = 0
        self.address = ""
    }
}
