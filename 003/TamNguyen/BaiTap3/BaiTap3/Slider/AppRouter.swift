//
//  AppRouter.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/05/2023.
//

import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .login
}

enum AppState {
    case login
    case welcome
}
