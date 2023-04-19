//
//  Account.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import SwiftUI

class Account: ObservableObject {

    @Published var username: String?
    @Published var password: String?
    @Published var fullname: String?
    @Published var age: Int?
    @Published var address: String?

    init(username: String? = nil, password: String? = nil, fullname: String? = nil, age: Int? = nil, address: String? = nil) {
        self.username = username
        self.password = password
        self.fullname = fullname
        self.age = age
        self.address = address
    }
    
    func updateUser(fullname: String, age: Int, address: String) {
        self.fullname = fullname
        self.age = age
        self.address = address
    }
}
