//
//  MySubTabView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI


struct MySubTabView: View {

    @ObservedObject var tabbarRouter: TabBarRouter

    var body: some View {

        HStack(spacing: 20) {
            let filteredTab = Tab.allCases.filter { $0 != .plus }
            ForEach(filteredTab, id: \.rawValue) { tab in
                Button(action: {
                    tabbarRouter.currentTab = tab
                }, label: {
                        Text("#\(tab.rawValue.capitalized)")
                    })
            }
        }
    }
}

