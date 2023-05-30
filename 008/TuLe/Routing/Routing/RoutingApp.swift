//
//  RoutingApp.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 08/05/2023.
//

import SwiftUI

@main
struct RoutingApp: App {

    @StateObject var appRouter = StorageData()
    @StateObject var errorManager = ErrorManager()
    
    @ViewBuilder
    var rootView: some View {
        switch appRouter.appState {
        case .main:
            MainView()
        case .login:
            LoginView()
        case .tutorial:
            TutorialView()
        }
    }

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .environmentObject(errorManager)
        }
    }
}

class StorageData: ObservableObject {
    @AppStorage("appState") var appState: AppState = .tutorial
    @AppStorage("loginUser") var dataLogin: Data?
}

enum AppState: String, Codable, CaseIterable {
    case main
    case login
    case tutorial
}
