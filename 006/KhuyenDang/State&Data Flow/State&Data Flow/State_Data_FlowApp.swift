//
//  State_Data_FlowApp.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

@main
struct State_Data_FlowApp: App {

    @StateObject var appRouter = AppRouter()
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @StateObject var account = Account()

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .environmentObject(account)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .launch:
            LaunchScreen()
        case .tutorial:
            TutorialView()
        case .login:
            LoginView()
        case .home:
            HomeView()
        }
    }
}
