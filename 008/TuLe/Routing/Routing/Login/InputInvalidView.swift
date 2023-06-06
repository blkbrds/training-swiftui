//
//  ErrorView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 14/05/2023.
//

import SwiftUI

struct InputInvalidView: View {

    var imageName: String
    var messageError: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.red)
            Text(messageError)
                .foregroundColor(.gray)
        }
    }
}

enum InputInvalidType {
    case wrong
    case unlock
    
    func getImageError() -> String {
        switch self {
        case .wrong:
            return "x.square"
        case .unlock:
            return "lock.open"
        }
    }
}
