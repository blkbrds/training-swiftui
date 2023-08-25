//
//  Exercise6App.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 09/08/2023.
//

import SwiftUI

@main
struct Exercise6App: App {

    @StateObject var appRouter: AppRouter = .init()
    @AppStorage("isOnDarkMode") var isOnDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .preferredColorScheme(isOnDarkMode ? .dark : .light)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .home:
            HomeView()
        case .login:
            LoginView()
        case .welcome:
            WelcomeView()
        }
    }
}
