//
//  SettingView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 25/08/2023.
//

import SwiftUI

struct SettingView: View {

    var body: some View {
        List {
            SettingCellView(type: .darkMode)
            SettingCellView(type: .notification)
        }
        .navigationTitle("Setting")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
