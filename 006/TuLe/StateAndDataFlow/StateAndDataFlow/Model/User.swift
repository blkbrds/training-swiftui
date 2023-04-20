//
//  User.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return
            lhs.email == rhs.email &&
            lhs.password == rhs.password
    }
    
    func saveData() -> Data? {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)
        return data
    }
}
