//
//  BaiTap2App.swift
//  BaiTap2
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 21/05/2023.
//

import SwiftUI

@main
struct BaiTap2App: App {
    
    @Environment (\.scenePhase) private var scenePhase
    @State var name: String = ""
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            LightDarkModelSettingDevice()
            //            ContentView()
            //            DeepLinkView(name: name)
            //                .onOpenURL { url in
            //                name = url.valueOf("name") ?? ""
            //
            //                print(url.absoluteURL)
            //                print(name)
            //            }
            //        }.onChange(of: scenePhase) { newValue in
            //            switch newValue {
            //            case .background:
            //                print("App State : Background")
            //                appDelegate.applicationDidEnterBackground(UIApplication.shared)
            //            case .inactive:
            //                print("App State : Inactive")
            //            case .active:
            //                print("App State : Active")
            //                appDelegate.applicationDidBecomeActive(UIApplication.shared)
            //            @unknown default:
            //                print("App State : Unknown")
            //            }
            //        }
        }
    }
}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
