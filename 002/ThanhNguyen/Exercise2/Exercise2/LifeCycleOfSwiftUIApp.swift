//
//  LifeCycleOfSwiftUIApp.swift
//  Exercise2
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 30/06/2023.
//

import SwiftUI

@main
struct LifeCycleOfSwiftUIApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("App state -> ACTIVE")
            case .background:
                print("App state -> BACKGROUND")
            case .inactive:
                print("App state -> INACTIVE")
            @unknown default:
                print("App state -> UNKNOWN")
            }
        }
    }
}
