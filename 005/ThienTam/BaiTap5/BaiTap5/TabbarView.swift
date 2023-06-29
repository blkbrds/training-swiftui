//
//  TabbarView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home View
            HomeScrollView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            // Profile View
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(1)
            
            // Placeholder View for Plus Button
            EmptyView()
                .tabItem {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .tag(2)
        }
        .overlay(
            Button(action: {
                // Action for Plus Button
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
            }
            .offset(y: -30), alignment: .bottom
        )
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
