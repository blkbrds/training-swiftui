//
//  AppDelegate.swift
//  Lesson2
//
//  Created by Lam Le T. [2] VN.Danang on 6/30/23.
//

import UIKit
class MyAppDelegate: UIResponder, UIApplicationDelegate {
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate ==> didFinishLaunchingWithOptions ==> called")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate ==> applicationDidBecomeActive ==> called")
    }
        
    func applicationDidEnterBackground(_ application: UIApplication) {
            print("AppDelegate ==> applicationDidEnterBackground ==> called")
    }
        
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("AppDelegate ==> URL ==> called")
            return true
    }
}

