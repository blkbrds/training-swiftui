//
//  MyTabView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MyTabView: View {

    @StateObject var tabbarRouter = TabBarRouter()
    var tabItems = Tab.allCases
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {

        VStack {
            TabView(selection: $tabbarRouter.currentTab) {
                HomeView()
                    .environmentObject(tabbarRouter)
                    .tag(tabItems[0])
                    .ignoresSafeArea(.all)
                MapView()
                    .environmentObject(tabbarRouter)
                    .tag(tabItems[1])
                    .ignoresSafeArea(.all)
                // PlusView --> Empty
                CartView()
                    .environmentObject(tabbarRouter)
                    .tag(tabItems[3])
                    .ignoresSafeArea(.all)
                ProfileView()
                    .environmentObject(tabbarRouter)
                    .tag(tabItems[4])
                    .ignoresSafeArea(.all)

            }
            Spacer(minLength: 0)
            MyTab(tabItems: tabItems, tabbarRouter: tabbarRouter)
        }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(Color.white)
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
