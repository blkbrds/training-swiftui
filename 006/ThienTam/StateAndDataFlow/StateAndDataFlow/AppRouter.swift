//
//  AppRouter.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 16/06/2023.
//

import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .login
}

enum AppState {
    case setting
    case tutorial
    case login
    case home
    case edit
}
