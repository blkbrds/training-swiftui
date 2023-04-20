//
//  SettingViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import Foundation

class SettingViewModel: ObservableObject {
    
    @Published var user: User = User(email: "", password: "")
    @Published var isNortify: Bool = false
    @Published var isDarkMode: Bool = false
    
    init(user: User?, isNortify: Bool?, isDarkMode: Bool?) {
        self.user = user ?? User(email: "", password: "")
        self.isNortify = isNortify ?? false
        self.isDarkMode = isDarkMode ?? false
    }
    
    func saveData() -> Data? {
        return user.saveData()
    }
}
