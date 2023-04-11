//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 26/03/2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    @StateObject var appRouter = AppRouter()
    
    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .home(let data):
            HomeView(data: data)
        case .login:
            LoginView()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }
}

class AppRouter: ObservableObject {
    @Published var state: AppState = .login
}

enum AppState {
    case home(data: User)
    case login
}
