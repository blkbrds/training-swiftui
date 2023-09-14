//
//  SettingCellView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 25/08/2023.
//

import SwiftUI

struct SettingCellView: View {

    enum SettingType {
        case notification
        case darkMode

        var title: String {
            switch self {
            case .notification:
                return "Notification"
            case .darkMode:
                return "Dark Mode"
            }
        }

        var imageName: String {
            switch self {
            case .darkMode:
                return "moonphase.last.quarter.inverse"
            case .notification:
                return "bell.fill"
            }
        }
    }

    @Environment(\.colorScheme) var colorScheme
    var type: SettingType
    let localStorage: LocalStorage = .init()

    var body: some View {
        HStack {
            Image(systemName: type.imageName)
                .resizable()
                .frame(width: 30, height: 30)
            switch type {
            case .darkMode:
                Toggle(type.title, isOn: localStorage.$isOnDarkMode)
                    .toggleSetting()
            case .notification:
                Toggle(type.title, isOn: localStorage.$isOnNotification)
                    .toggleSetting()
            }
        }
    }
}

struct SettingToggleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold))
            .padding(.leading)
    }
}

extension View {
    func toggleSetting() -> some View {
        self.modifier(SettingToggleModifier())
    }
}

struct SettingCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingCellView(type: .darkMode)
    }
}
