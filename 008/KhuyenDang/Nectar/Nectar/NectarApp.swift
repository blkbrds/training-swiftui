//
//  NectarApp.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

@main
struct NectarApp: App {

    @StateObject var appRouter = AppRouter()
    @StateObject var tabbarRouter = TabBarRouter()
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .environmentObject(tabbarRouter)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .launch:
            LaunchView()
        case .tutorial:
            TutorialView()
        case .login:
            LoginView()
        case .tabbar:
            MyTabView()
        }
    }
}
