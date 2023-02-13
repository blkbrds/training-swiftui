//
//  BaiTap2App.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

@main
struct BaiTap2App: App {

    @State var deeplinkTarget: DeeplinkManager.DeeplinkTarget?
    @Environment(\.scenePhase) private var scenePhase
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
        
    var body: some Scene {
        WindowGroup {
            Group {
                switch self.deeplinkTarget {
                case .home(let name):
                    ContentView(name: name)
                case .details(let name):
                    SecondView  (name: name)
                case .none:
                    LightAndDarkMode2View()
                }
            }
            .onOpenURL { url in
                let deeplinkManager = DeeplinkManager()
                let deeplink = deeplinkManager.manage(url)
                self.deeplinkTarget = deeplink
            }
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("App State : Background")
                appDelegate.applicationDidEnterBackground(UIApplication.shared)
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
                appDelegate.applicationDidBecomeActive(UIApplication.shared)
            @unknown default:
                print("App State : Unknown")
            }
        }
    }
}
