//
//  AppDelegate.swift
//  SwiftUIApp
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/02/2023.
//

import Foundation
import UIKit

class MyAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ appplication: UIApplication, didFinishLaunchingWithOptions lauchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("AppDelegate > didFinishLaunchingWithOptions > called")
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate > applicationDidBecomeActive > called")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate > applicationDidEnterBackground > called")
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        print("AppDelegate > URL > called")
        return true
    }
}
