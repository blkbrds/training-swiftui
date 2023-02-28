//
//  ViewsAndModifierApp.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 15/02/2023.
//

import SwiftUI

@main
struct ViewsAndModifierApp: App {
    @StateObject var appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }
    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .tutorial:
            WelcomeScreen()
        case .login:
            Login()
        }
    }
}
