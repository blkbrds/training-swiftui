//
//  AppRouter.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {

    @Published var state: AppState = .firstTutorial
}

enum AppState {
    case login
    case welcome
    case firstTutorial
    case testScreen
}
