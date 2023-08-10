//
//  ViewModifiersApp.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

@main
struct ViewModifiersApp: App {

    @StateObject var coordinator = Coordinator()

    @ViewBuilder
    var rootView: some View {
        switch coordinator.screenType {
        case .welcome:
            WelcomeView()
        case .login:
            LoginView(username: "", password: "")
        }
    }

    var body: some Scene {
        WindowGroup {

            /// ---Bai Tap 1---
            // AvatarView()

            /// ---Bai Tap 2---
            // ListAvatarView()

            /// ---Bai Tap 3---
            // CalculatorView()

            /// ---Bai Tap 4---
            // ThreeSliderView()

            /// ---Bai Tap 5---
            // CustomImageView()

            /// ---Bai Tap 6+7---
            // TextFieldDemoView()

            /// ---Bai Tap 8---
            // ListButtonView()

            /// ---Bai Tap 9---
            // LoginView(username: "", password: "")

            /// ---Bai Tap10 ---
            rootView
                .environmentObject(coordinator)
        }
    }
}
