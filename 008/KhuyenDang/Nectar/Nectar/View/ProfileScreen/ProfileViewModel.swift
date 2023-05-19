//
//  ProfileViewModel.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    private var localStorage = LocalStorage()
    
    func logout() async -> Bool {
        do {
            localStorage.resetUser()
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return true
        } catch {
            return false
        }
    }
}
