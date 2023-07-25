//
//  LoginFormVM.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/24/23.
//

import Foundation
import SwiftUI
import Combine

final class LoginFormVM: ObservableObject {
    @Published var userName: String = ""
    @Published var passWord: String = ""
    
    func validationTextField() -> Bool {
        if (userName.isEmpty || passWord.isEmpty) {
            return true
        } else {
            return false
        }
    }
}
