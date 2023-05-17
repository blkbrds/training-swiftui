//
//  SettingCell.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/04/2023.
//

import SwiftUI

enum TypeSetting {
    case notification
    case darkMode
    case rememberMe

    func value() -> (String, String) {
        switch self {
        case .notification:
            return ("Notifications", "notification")
        case .darkMode:
            return ("Dark mode", "darkmode")
        case .rememberMe:
            return ("Save info login", "save_login")
        }
    }
}

struct SettingCell: View {

    var typeSetting: TypeSetting = .notification
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var account: Account
    var setting = Setting()

    var body: some View {

        HStack {
            Image(typeSetting.value().1)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.leading, -10)

            switch typeSetting {
            case .notification:
                Toggle(typeSetting.value().0, isOn: setting.$isNotificationEnabled)
            case .darkMode:
                Toggle(typeSetting.value().0, isOn: setting.$isDarkMode)
                    .onChange(of: setting.isDarkMode) { newValue in
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
                    if newValue {
                        window.overrideUserInterfaceStyle = .dark
                    } else {
                        window.overrideUserInterfaceStyle = .light
                    }
                }
            case .rememberMe:
                Toggle(typeSetting.value().0, isOn: setting.$isSaveData)
            }
        }
    }
}

struct SettingCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
