//
//  AppDelegate.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 19/06/2023.
//

import Foundation

import UIKit

class MyAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate => didFinishLaunchingWithOptions is being called")
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate => applicationDidBecomeActive is being called")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate => applicationDidEnterBackground is being called")
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        print("AppDelegate => open URL is being called")
        return true
    }
}
