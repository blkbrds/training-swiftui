//
//  LifeCycleApp.swift
//  BaiTap2
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/05/2023.
//

import SwiftUI

//@main
struct LifeCycleApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            LightDarkModelSettingDevice()
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
