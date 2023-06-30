//
//  Exercise2App.swift
//  Exercise2
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import SwiftUI

@main
struct Exercise2App: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    print("URL -> \(url.absoluteString)")
                }
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
