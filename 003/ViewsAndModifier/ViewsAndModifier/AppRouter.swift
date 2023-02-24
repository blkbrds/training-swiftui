//
//  AppRouter.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/02/2023.
//

import SwiftUI

class AppRouter: ObservableObject {
    
    @Published var state: AppState = .tutorial
}

enum AppState {
    case tutorial
    case login
}
