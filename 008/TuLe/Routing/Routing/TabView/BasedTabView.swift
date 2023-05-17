//
//  BasedTabView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 15/05/2023.
//

import SwiftUI

struct BasedTabView: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
                .tag(1)
            VideosView()
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Videos")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.green)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BasedTabView()
    }
}
