//
//  LoginFormViewModel.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import Foundation
import SwiftUI
import Combine

final class LoginFormViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    
    func validationTextField() -> Bool {
        if (userName.isEmpty || password.isEmpty) {
            return true
        } else {
            return false
        }
    }
}
