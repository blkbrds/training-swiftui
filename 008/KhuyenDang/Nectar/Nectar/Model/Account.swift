//
//  Account.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import SwiftUI

class Account: ObservableObject {

    @Published var email: String
    @Published var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
