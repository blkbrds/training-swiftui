//
//  Exercise3App.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 03/07/2023.
//

import SwiftUI

@main
struct Exercise3App: App {

    @StateObject var appRouter: AppRouter = .init()

    var body: some Scene {
        WindowGroup {
//            AvatarView() // part 1
//            ListAvatarView() // part 2
//            CalculatorView() // part 3
//            ColorSliderView() // part 4
//            ImageContentView() // part 5
//            DemoTextFieldView() // part 6-7
//            DemoButtonView() // part 8
//            LoginView() // part 9
            rootView.environmentObject(appRouter) // part 10
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .welcome:
            WelcomeView()
        case .login:
            LoginView(email: "", password: "")
        }
    }
}
