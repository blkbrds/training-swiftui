//
//  AppRouter.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

final class AppRouter: ObservableObject {

    enum AppState {
        case welcome
        case login
    }

    @Published var state: AppState = .welcome
}
