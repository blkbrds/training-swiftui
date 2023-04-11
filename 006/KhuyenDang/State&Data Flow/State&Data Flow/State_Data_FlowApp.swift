//
//  State_Data_FlowApp.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

@main
struct State_Data_FlowApp: App {

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
        case .login:
            LoginView()
        case .home(let account):
            HomeView(account: account)
        }
    }
}
