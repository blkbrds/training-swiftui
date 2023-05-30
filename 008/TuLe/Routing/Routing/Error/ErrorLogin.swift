//
//  ErrorLogin.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 30/05/2023.
//

import Foundation
import SwiftUI

enum ErrorLoginType: Error {
    case invalid
    case connectFail
    case none
    
    func errorMessage() -> String {
        switch self {
        case .invalid:
            return "Tên email hoặc mật khẩu không chính xác"
        case .connectFail:
            return "Lỗi khi kết nối tới sever"
        case .none:
            return ""
        }
    }
}

extension Error {
    func errorAlert() -> Alert {
        return Alert(title: Text("Login fail"), message: Text("\(ErrorLoginType.errorMessage(self as? ErrorLoginType ?? .invalid)())"), dismissButton: .default(Text("Got it!")))
    }
}
