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

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }


    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .launch:
            HomeView()
        case .tutorial:
            HomeView()
        case .login:
            LoginView()
        case .home:
            HomeView()
        }
    }
}
