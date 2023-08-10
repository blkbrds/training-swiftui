//
//  Router.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 04/07/2023.
//

import SwiftUI

enum ScreenType {
    case welcome
    case login
}

final class Coordinator: ObservableObject {
    @Published var screenType: ScreenType = .welcome

    func setScreenType(screenType: ScreenType) {
        self.screenType = screenType
    }
}
