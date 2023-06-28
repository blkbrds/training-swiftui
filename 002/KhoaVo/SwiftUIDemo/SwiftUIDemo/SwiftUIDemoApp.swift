//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

enum ScreenType: String {
    case home = "home"
    case setting = "setting"
    case detail = "detail"
}

@main
struct SwiftUIDemoApp: App {

    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    @State var screenType: ScreenType = .home
    @State var value: String = ""

    var body: some Scene {
        WindowGroup {
            /// ---Bai Tap 2---
            AppRootView(screenType: $screenType, value: $value)
                .onOpenURL(perform: { url in
                    print(url.absoluteString)
                    if let value = url.getQueryStringParameter(param: "screenType"), let screenType = ScreenType(rawValue: value) {
                        self.screenType = screenType
                        if let value = url.getQueryStringParameter(param: "value") {
                            self.value = value
                        }
                        print(self.value)
                        print(self.screenType)
                    }
                })
            /// ---Bai Tap 4---
            // ChangeModeView()
            /// ---Bai Tap 5---
            // AlertModeView()
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
