//
//  Lesson2App.swift
//  Lesson2
//
//  Created by Lam Le T. [2] VN.Danang on 6/30/23.
//

import SwiftUI

@main
struct Lesson2App: App {
    
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    @State var name: String = ""
    
    init() {
        print("Init App")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL(perform: { url in
                name = url.valueOf("name") ?? ""
                print(url.absoluteURL)
                print(name)
            })
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("Life Cycle : Phase 1 Backgroup")
                appDelegate.applicationDidEnterBackground(UIApplication.shared)
            case .inactive:
                print("Life Cycle : Phase 2 InActive")
            case .active:
                print("Life Cycle : Phase 3 Active")
                appDelegate.applicationDidBecomeActive(UIApplication.shared)
            @unknown default:
                print("Life Cycle : Unknown")
            }
        }
    }
}


extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
