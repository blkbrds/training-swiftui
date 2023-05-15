//
//  ForgotPasswordViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    
    func isForgotDisable() -> Bool {
        return email.isValidEmail()
    }
}
