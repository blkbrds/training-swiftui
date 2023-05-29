//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
            .onChange(of: scenePhase) { state in
            switch state {
            case .active:
                print("App is active")
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("App is in an unknown state")
            }
        }
    }
}
