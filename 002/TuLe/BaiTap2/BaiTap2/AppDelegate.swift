//
//  AppDelegate.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import UIKit

class MyAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate > didFinishLaunchingWithOptions > called")
        return true
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate > willFinishLaunchingWithOptions > called")
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate > applicationDidBecomeActive > called")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate > applicationDidEnterBackground > called")
    }
}
