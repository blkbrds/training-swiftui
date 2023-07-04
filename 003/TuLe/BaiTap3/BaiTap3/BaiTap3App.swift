//
//  BaiTap3App.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 15/02/2023.
//

import SwiftUI

@main
struct BaiTap3App: App {

    @StateObject var appRouter = AppRouter()

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .welcome:
            CaculatorView()
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
    @Published var state: AppState = .welcome
}

enum AppState {
    case welcome
    case login
}
