//
//  SettingView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/04/2023.
//

import SwiftUI

struct SettingView: View {

    var body: some View {

        VStack {
            List {
                SettingCell(typeSetting: .notification)
                SettingCell(typeSetting: .darkMode)
                SettingCell(typeSetting: .rememberMe)
            }
        }
            .navigationTitle("Setting")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
