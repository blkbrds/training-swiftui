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
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    @State var name: String = ""

    init() {
        print("didFinishLaunchWith with SwiftUI")
    }

    var body: some Scene {
        WindowGroup {
//            ContentView()
            Bai2View(name: name)
                .onOpenURL { url in
                    guard let urlComponent = URLComponents(string: url.absoluteString) else { return }
                    name = urlComponent.queryItems?.first(where: { $0.name == "name"} )?.value ?? ""
                    print(url.absoluteURL)
                    print(name)
                }
        }
            .onChange(of: scenePhase) { state in
            switch state {
            case .active:
                print("App is active")
                appDelegate.applicationDidBecomeActive(UIApplication.shared)
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
