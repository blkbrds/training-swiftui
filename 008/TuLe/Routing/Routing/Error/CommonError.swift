//
//  CommonError.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 30/05/2023.
//

import Foundation
import SwiftUI

enum CommonError: Error {
    case loginInvalid
    case networkError
    case unknown
    
    func localizedDescription() -> String {
        switch self {
        case .loginInvalid:
            return "Tên email hoặc mật khẩu không chính xác"
        case .networkError:
            return "Lỗi khi kết nối tới sever"
        case .unknown:
            return ""
        }
    }
}

extension Error {
    func errorAlert() -> Alert {
        return Alert(title: Text("Login fail"), message: Text("\(CommonError.localizedDescription(self as? CommonError ?? .unknown)())"), dismissButton: .default(Text("Got it!")))
    }
}
