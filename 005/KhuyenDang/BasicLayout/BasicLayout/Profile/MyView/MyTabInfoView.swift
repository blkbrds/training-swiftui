//
//  MyTabInfoView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/03/2023.
//

import SwiftUI

struct MyTabInfoView: View {

    @State private var selectedTab: Int = 0

    let tabs: [Tab] = [
            .init(name: "PHOTOS"),
            .init(name: "VIDEOS"),
            .init(name: "POSTS"),
            .init(name: "ABOUT")
    ]

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {

                    Divider()
                    // Tabs
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                    // Views
                    TabView(selection: $selectedTab,
                        content: {
                            PhotoView()
                                .tag(0)
                            VideoView()
                                .tag(1)
                            PostView()
                                .tag(2)
                            AboutView()
                                .tag(3)
                        })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: geo.size.height)
                }
            }
        }
    }
}

struct MyTabInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabInfoView()
    }
}
