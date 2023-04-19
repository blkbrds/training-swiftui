//
//  EditViewModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import Foundation
import SwiftUI

class EditViewModel: ObservableObject {

    @Published var previousFullname: String
    @Published var previousAddress: String
    @Published var previousAge: Int
    @Published var isShowAlert: Bool = false
    private var localStorage = LocalStorage()

    init(previousFullname: String, previousAddress: String, previousAge: Int) {
        self.previousFullname = previousFullname
        self.previousAddress = previousAddress
        self.previousAge = previousAge
    }

    func handleEditProfile() {
        if isValidEdit() {
            localStorage.updateUser(fullname: previousFullname, age: previousAge, address: previousAddress)
        } else {
            isShowAlert = true
        }
    }

    private func isValidEdit() -> Bool {
        return !previousFullname.isEmpty && previousAge != 0 && !previousAddress.isEmpty
    }
}
