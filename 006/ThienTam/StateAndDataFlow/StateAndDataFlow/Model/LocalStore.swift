//
//  LocalStore.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 24/06/2023.
//

import SwiftUI

final class LocalStore {

    @AppStorage("username") private var userName: String = ""
    @AppStorage("fullname") private var fullName: String = ""
    @AppStorage("userId") private var userId: String?

    static var shared: LocalStore = {
        let instance = LocalStore()
        return instance
    }()

    private init() { }

    func setUser(userName: String, fullName: String, userId: String?) {
        self.fullName = fullName
        self.userName = userName
        self.userId = userId
    }
    
    func updateFullName(name: String) {
        self.fullName = name
    }

    func clearUser() {
        self.fullName = ""
        self.userName = ""
        self.userId = nil
    }

    func getFullName() -> String {
        return fullName
    }
    
    func isHaveUserId() -> Bool {
        return userId != nil
    }
}
