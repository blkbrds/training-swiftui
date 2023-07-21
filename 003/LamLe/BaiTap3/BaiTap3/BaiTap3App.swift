//
//  BaiTap3App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

@main
struct BaiTap3App: App {
    @StateObject var appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            rootView.environmentObject(appRouter)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .welcome:
            WelcomeScreen2View()
        case .login:
            LoginFormView()
        case .firstTutorial:
            WelcomeScreen1View()
        case .testScreen:
            CalculatorView()
        }
    }
}
