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
        
    var body: some Scene {
        WindowGroup {
            Group {
                switch self.deeplinkTarget {
                case .home(let name):
                    ContentView(name: name)
                case .details(let name):
                    SecondView  (name: name)
                case .none:
                    ContentView(name: "")
                }
            }
            .onOpenURL { url in
                let deeplinkManager = DeeplinkManager()
                let deeplink = deeplinkManager.manage(url)
                self.deeplinkTarget = deeplink
            }
        }
    }
}
