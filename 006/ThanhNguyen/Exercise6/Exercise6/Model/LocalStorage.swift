//
//  LocalStorage.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import SwiftUI

class LocalStorage: ObservableObject {
//    @AppStorage("appState") var appState: AppState = .tutorial
    @AppStorage("savedAccountLogin") var savedAccountLogin: Account? = nil
//    @AppStorage("darkMode") var isDarkMode: Bool = false
//    @AppStorage("nortify") var nortify: Bool = true

    public func saveAccount(account: Account) {
        savedAccountLogin = account
    }
}
