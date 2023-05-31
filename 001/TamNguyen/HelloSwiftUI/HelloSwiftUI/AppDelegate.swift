//
//  AppDelegate.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import Foundation
import UIKit
class MyAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate > didFinishLaunchingWithOptions > called")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate > applicationDidBecomeActive > called")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate > applicationDidEnterBackground > called")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("AppDelegate > URL > called")
        return true
    }
}
