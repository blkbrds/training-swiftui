//
//  CustomToggle.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/06/2023.
//

import SwiftUI

enum SettingCase {
    case notif
    case serviveNotif
    case darkMode
    case location
    
    var toString: String {
        switch self {
        case .notif:
            return "Device Notification Setting"
        case .serviveNotif:
            return "Service Notification Setting"
        case .darkMode:
            return "Dark Mode"
        case .location:
            return "Share Location"
        }
    }
}

struct CustomToggle: View {
    
    @Binding var isSwitchOn: Bool
    var type: SettingCase

    var body: some View {
        Toggle(type.toString, isOn: $isSwitchOn)
        .padding(.horizontal, 20)
    }
}

