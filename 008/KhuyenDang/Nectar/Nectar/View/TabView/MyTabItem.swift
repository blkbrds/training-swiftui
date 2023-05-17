//
//  MyTabItem.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 12/05/2023.
//

import SwiftUI

struct MyTabItem: View {

    var tab: Tab
    private var fillImage: String {
        tab.icon + ".fill"
    }
    @ObservedObject var tabbarRouter: TabBarRouter

    var body: some View {
        Button(action: {
            tabbarRouter.currentTab = tab
        }, label: {
                VStack {
                    Image(systemName: tabbarRouter.currentTab == tab ? fillImage : tab.icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 26, height: 26)
                        .foregroundColor(tabbarRouter.currentTab == tab ? Color("green") : .black)

                    Text(tab == .plus ? "" : tab.rawValue.capitalized)
                        .font(.caption)
                        .foregroundColor(.black)
                }
                    .padding(.top)
                    .frame(width: 70, height: 30)
            })
    }
}

struct MyTabItem_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
