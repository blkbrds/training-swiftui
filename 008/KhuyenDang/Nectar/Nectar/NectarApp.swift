//
//  NectarApp.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

@main
struct NectarApp: App {

    @StateObject var appRouter = AppRouter()
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .login:
            LoginView()
        }
    }
}
