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
            ZStack {
                MyTab(tabItems: tabItems, tabbarRouter: tabbarRouter)
                Button(action: {
                    isPresented = true
                }) {
                    Image("plus_tabbar")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .offset(y: -45)
                }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isPresented) {
                    PlusView()
                }
            }
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
