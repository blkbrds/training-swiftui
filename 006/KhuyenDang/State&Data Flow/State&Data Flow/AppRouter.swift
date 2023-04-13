//
//  AppRouter.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/04/2023.
//

import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .launch
}

enum AppState {
    case launch
    case tutorial
    case login
    case home
}

class LocalStorage {
    
    @AppStorage("fullname") var fullname: String = ""
    @AppStorage("age") var age: Int = 0
    @AppStorage("address") var address: String = ""
    
    func setUser(fullname: String, age: Int, address: String) {
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
