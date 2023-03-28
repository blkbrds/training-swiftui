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
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
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
                                    }.fixedSize()
                                })
                        }
                    }
                        .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                    Divider()
                }
                .padding(.bottom, 10)
            }
        }
            .onAppear(perform: {
            UIScrollView.appearance().bounces = fixed ? false : true
        })
            .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}
