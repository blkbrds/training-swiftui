//
//  MyTabView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MyTabView: View {

    @State var selectedTab: Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .home:
                    HomeView(selectedTab: $selectedTab)
                case .map:
                    MapView(selectedTab: $selectedTab)
                case .plus:
                    EmptyView()
                case .cart:
                    CartView(selectedTab: $selectedTab)
                case .profile:
                    ProfileView(selectedTab: $selectedTab)
                }
            }
            VStack {
                Spacer()
                MyTab(selectedTab: $selectedTab)
            }
        }
            .ignoresSafeArea()
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
