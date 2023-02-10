//
//  BaiTap2App.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 10/02/2023.
//

import SwiftUI

@main
struct BaiTap2App: App {

    @Environment(\.scenePhase) private var scenePhase
    @State var name: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL(perform: { url in
                    name = url.valueOf("name") ?? ""
                })
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
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
