//
//  AppRouter.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 23/08/2023.
//

import SwiftUI

final class AppRouter: ObservableObject {

    enum AppState: String {
        case home
        case login
        case tutorial
    }

    @Published var state: AppState = .login
}
