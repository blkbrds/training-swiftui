//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 26/03/2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    @StateObject var appRouter = StorageData()
    
    @ViewBuilder
    var rootView: some View {
        switch appRouter.appState {
        case .home:
            HomeView()
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
        }
    }
}

class StorageData: ObservableObject {
    @AppStorage("appState") var appState: AppState = .tutorial
    @AppStorage("loginUser") var dataLogin: Data?
}

enum AppState: String, Codable, CaseIterable {
    case home
    case login
    case tutorial
}
