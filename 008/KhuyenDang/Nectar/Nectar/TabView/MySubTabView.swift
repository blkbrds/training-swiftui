//
//  MySubTabView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI


struct MySubTabView: View {

    @Binding var selectedTab: Tab

    var body: some View {

        HStack(spacing: 20) {
            let filteredTab = Tab.allCases.filter { $0 != .plus }
            ForEach(filteredTab, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }, label: {
                        Text("#\(tab.rawValue.capitalized)")
                    })
            }
        }
    }
}

