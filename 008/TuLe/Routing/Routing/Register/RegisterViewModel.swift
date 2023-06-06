//
//  RegisterViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isShowPassword: Bool = false
    @Published var isShowPopUp: Bool = false
    @Published var jsonProvider: JSONProvider = JSONProvider()
    
    func isSignUpDisable() -> Bool {
        return email.isValidEmail() && password.count >= 8 && userName.count >= 4 && password == confirmPassword 
    }
    
    func writeJson() {
        jsonProvider.userContainer.append(UserContainer(user: User(email: email, userName: userName, password: password)))
        jsonProvider.writeToFile()
    }
}
