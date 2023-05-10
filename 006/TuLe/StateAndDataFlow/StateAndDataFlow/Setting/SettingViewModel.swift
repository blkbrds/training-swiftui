//
//  SettingViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import Foundation

class SettingViewModel: ObservableObject {
    
    @Published var user: User
    @Published var isNortify: Bool
    @Published var isDarkMode: Bool
    @Published var isShowAlert: Bool = false
    
    init(user: User, isNortify: Bool, isDarkMode: Bool) {
        self.user = user
        self.isNortify = isNortify
        self.isDarkMode = isDarkMode
    }
    
    func saveData() -> Data? {
        if user.isValidUser() {
            return user.saveData()
        } else {
            isShowAlert = true
            return nil
        }
    }
}
