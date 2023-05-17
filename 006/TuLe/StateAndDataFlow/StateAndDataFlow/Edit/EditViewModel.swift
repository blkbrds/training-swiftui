//
//  EditViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class EditViewModel: ObservableObject {
    
    @Published var user: User
    @Published var isShowAlert: Bool = false
    
    init(user: User) {
        self.user = user
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
