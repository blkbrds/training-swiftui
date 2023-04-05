//
//  LoginModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/04/2023.
//

import SwiftUI

final class LoginModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    func isValidAccount(username: String, password: String) async -> Bool {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let isValidate = DataManager().accounts.contains { $0.0 == username && $0.1 == password }
        do {
            try await Task.sleep(nanoseconds: 3 * 1000000000)
        } catch { }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
        return isValidate
    }
}
