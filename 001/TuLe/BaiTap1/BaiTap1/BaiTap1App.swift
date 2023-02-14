//
//  BaiTap1App.swift
//  BaiTap1
//
//  Created by Tu Le C. [2] VN.Danang on 09/02/2023.
//

import SwiftUI

@main
struct BaiTap1App: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
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
