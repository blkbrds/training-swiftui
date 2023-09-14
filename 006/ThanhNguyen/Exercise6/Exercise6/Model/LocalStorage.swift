//
//  LocalStorage.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import SwiftUI

class LocalStorage: ObservableObject {
    @AppStorage("savedAccountLogin") var savedAccountLogin: Account? = nil
    @AppStorage("isOnNotification") var isOnNotification: Bool = false
    @AppStorage("isOnDarkMode") var isOnDarkMode: Bool = false

    public func saveAccount(account: Account) {
        savedAccountLogin = account
    }

    public func getAccount() -> Account? {
        return savedAccountLogin
    }

    public func resetAccount() {
        savedAccountLogin = nil
    }
}
