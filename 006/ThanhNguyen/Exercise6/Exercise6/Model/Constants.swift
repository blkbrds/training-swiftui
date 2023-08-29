//
//  Constants.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/08/2023.
//

import Foundation

struct Constants {
    static let defaultPage: Int = 0
    // Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
    static let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}
