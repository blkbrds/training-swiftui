//
//  AppRootView.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 16/06/2023.
//

import SwiftUI

struct AppRootView: View {

    @Binding var screenType: ScreenType
    @Binding var value: String

    var body: some View {
        Group {
            switch screenType {
            case .home:
                HomeView(value: $value)
            case .setting:
                SettingView(value: $value)
            case .detail:
                DetailView(value: $value)
            }
        }
    }
}
