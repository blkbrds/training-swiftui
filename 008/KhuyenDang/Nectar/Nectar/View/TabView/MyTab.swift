//
//  MyTab.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case map
    case plus
    case cart
    case profile

    var icon: String {
        switch self {
        case .home:
            return "house"
        case .map:
            return "map"
        case .plus:
            return ""
        case .cart:
            return "cart"
        case .profile:
            return "person"
        }
    }
}

class TabBarRouter: ObservableObject {
    @Published var currentTab: Tab = .home
}

struct MyTab: View {

    var tabItems: [Tab]
    @ObservedObject var tabbarRouter: TabBarRouter
    var action: () -> Void

    var body: some View {
        HStack {
            ForEach(tabItems, id: \.rawValue) { tab in
                GeometryReader { proxy in
                    MyTabItem(tab: tab, tabbarRouter: tabbarRouter)
                }
                    .frame(width: 70, height: 50)
            }
        }
            .padding(.horizontal, 25)
            .padding(.top)
            .padding(.bottom, 10)
            .background(Color.white.clipShape(TabbarShape()))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .padding(.top, -15)
            .ignoresSafeArea(.all, edges: .horizontal)
            .overlay(
            PlusTabbarButton(action: action)
                .offset(y: -45)
        )
    }
}

struct MyTab_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
