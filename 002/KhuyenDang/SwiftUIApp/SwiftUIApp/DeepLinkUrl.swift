//
//  DeepLinkUrl.swift
//  SwiftUIApp
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/02/2023.
//

//fxapp://fxapp.com?name=Khuyen
import SwiftUI
@main
struct DeepLinkUrl: App {
    
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    @State var name: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL(perform: { url in
                    name = url.valueOf("name")  ?? ""
                })
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

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
