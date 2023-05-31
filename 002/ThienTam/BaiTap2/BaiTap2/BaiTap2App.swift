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
            DeepLinkView(name: name)
        }
    }
}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
