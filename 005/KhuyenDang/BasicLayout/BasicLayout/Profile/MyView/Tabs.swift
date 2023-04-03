//
//  Tabs.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/03/2023.
//

import SwiftUI

struct Tab {
    var name: String?
}

struct Tabs: View {
    @State private var selectedTab: Int = 0
    let tabs: [Tab] = [
            .init(name: "PHOTOS"),
            .init(name: "VIDEOS"),
            .init(name: "POSTS"),
            .init(name: "ABOUT")
    ]

    var body: some View {
        Divider()
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0 ..< tabs.count, id: \.self) { row in
                    Button(action: {
                        withAnimation {
                            selectedTab = row
                        }
                    }, label: {
                            VStack(spacing: 0) {
                                HStack {
                                    Text(tabs[row].name ?? "")
                                        .foregroundColor(selectedTab == row ? .black : Color(red: 0.781, green: 0.776, blue: 0.794))
                                        .fontWeight(.medium)
                                        .padding([.top, .bottom], 10)
                                        .padding([.leading, .trailing])
                                }
                                // Bar Indicator
                                Rectangle().fill(selectedTab == row ? .black : .clear)
                                    .frame(height: 3)
                            }
                        })
                }
            }
                .padding([.leading, .trailing], 0)
            Divider()
                .padding(.bottom, 10)
            switch selectedTab {
            case 0:
                PhotoView()
            case 1:
                VideoView()
            case 2:
                PostView()
            default:
                AboutView()
            }
        }
            .padding(.bottom, 10)
    }
}
