//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by Khoa Vo T.A. VN.Danang on 15/06/2023.
//

import SwiftUI

@main
struct SwiftUIAppApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background:
                print("Change state to Background")
            case .inactive:
                print("Change state to Inactive")
            case .active:
                print("Change state to Active")
            @unknown default:
                print("Default unknown")
            }
        }
    }
}
