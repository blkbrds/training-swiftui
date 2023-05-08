//
//  AppRouter.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .login
}

enum AppState {
    case login
}
