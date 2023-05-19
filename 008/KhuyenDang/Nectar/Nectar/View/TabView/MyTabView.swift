//
//  MyTabView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MyTabView: View {

    @EnvironmentObject var tabbarRouter: TabBarRouter
    @State var isPresented = false
    var tabItems = Tab.allCases
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {

        VStack {
            TabView(selection: $tabbarRouter.currentTab) {
                HomeView()
                    .tag(tabItems[0])
                    .ignoresSafeArea(.all)
                MapView()
                    .tag(tabItems[1])
                    .ignoresSafeArea(.all)
                // PlusView --> Empty
                CartView()
                    .tag(tabItems[3])
                    .ignoresSafeArea(.all)
                ProfileView()
                    .tag(tabItems[4])
                    .ignoresSafeArea(.all)

            }
            Spacer(minLength: 0)
            MyTab(tabItems: tabItems, tabbarRouter: tabbarRouter, action: showPlusView)
        }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(Color.white)
            .sheet(isPresented: $isPresented) {
            PlusView()
        }
    }

    private func showPlusView() {
        isPresented = true
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
