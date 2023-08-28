//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 13/06/2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {

    @StateObject var appRouter = AppRouter()
    @AppStorage("isDarkMode") var isDarkMode = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("isRemoveTutorial") var isRemoveTutorial = false

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }

    func checkLogin() -> some View {
        Group {
            if isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
    }



    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .setting:
            SettingView()
        case .tutorial:
            if isRemoveTutorial {
                checkLogin()
            } else {
                TutorialView()
            }
        case .login:
            checkLogin()
        case .home:
            HomeView()
        case .edit:
            EditView()
        }
    }
}
