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
    @State var name: String = ""

    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL { url in
                    name = url.valueOf("name") ?? ""
                    print(url.absoluteURL)
                    print(name)
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

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
