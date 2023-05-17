//
//  LocalStorage.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import SwiftUI

class LocalStorage {

    @AppStorage("email") var email: String = ""
    @AppStorage("password") var password: String = ""

    func setUser(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func resetUser() {
        self.email = ""
        self.password = ""
    }
}
