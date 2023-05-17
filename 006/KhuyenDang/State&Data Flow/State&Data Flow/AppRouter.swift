//
//  AppRouter.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/04/2023.
//

import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .launch
}

enum AppState {
    case launch
    case tutorial
    case login
    case home
}
