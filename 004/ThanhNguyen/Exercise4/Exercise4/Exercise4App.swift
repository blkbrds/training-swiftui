//
//  Exercise4App.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 12/07/2023.
//

import SwiftUI

@main
struct Exercise4App: App {
    var body: some Scene {
        WindowGroup {
//            MySliderView() // part 1
            FingerInteractionView(scale: 0, rotate: .zero) // part 2, 3
        }
    }
}
