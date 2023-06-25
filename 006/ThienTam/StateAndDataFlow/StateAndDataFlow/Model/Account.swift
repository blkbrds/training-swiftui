//
//  Account.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 24/06/2023.
//

import Foundation

final class Account {
    let userName: String
    let password: String
    let userId: String?
    let fullName: String

    init(userName: String, password: String, userId: String?, fullName: String) {
        self.userName = userName
        self.password = password
        self.userId = userId
        self.fullName = fullName
    }
}
