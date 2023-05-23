//
//  BaiTap3App.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 11/05/2023.
//

import SwiftUI

@main
struct BaiTap3App: App {

    @StateObject var appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
//            ListAvatarView()
//            CalculatorView()
//            ImageView()
//            SliderView()
//            LoginView()
            rootView
                .environmentObject(appRouter)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .welcome:
            WelcomeView()
        case .login:
            LoginView()
        }
    }
}
