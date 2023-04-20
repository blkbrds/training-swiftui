//
//  DataExtension.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import Foundation

extension Data {
    func loadData() -> User {
        let decoder = JSONDecoder()
        guard let userData = try? decoder.decode(User.self, from: self) else {
            return User(email: "", password: "")
        }
        return userData
    }
}
