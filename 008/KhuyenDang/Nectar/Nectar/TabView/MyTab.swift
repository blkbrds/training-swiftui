//
//  MyTab.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case map
    case plus
    case cart
    case profile

    var logo: String {
        switch self {
        case .home:
            return "house"
        case .map:
            return "map"
        case .plus:
            return ""
        case .cart:
            return "cart"
        case .profile:
            return "person"
        }
    }
}

struct MyTab: View {
    @Binding var selectedTab: Tab
    @State var isPresented = false
    private var fillImage: String {
        selectedTab.logo + ".fill"
    }

    var body: some View {
        ZStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    if tab == .plus {
                        Spacer()
                        VStack {
                            EmptyView()
                        }
                        Spacer()
                    } else {
                        Spacer()
                        VStack {
                            Image(systemName: selectedTab == tab ? fillImage : tab.logo)
                                .scaleEffect(selectedTab == tab ? 1.25 : 1.0)

                            Text(tab.rawValue.capitalized)
                                .font(.system(size: 14))
                        }
                            .foregroundColor(selectedTab == tab ? Color("green") : Color.black)
                            .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        Spacer()
                    }
                }
            }
                .frame(height: 90)
                .background(Color.white.clipShape(TabbarShape()))
                .cornerRadius(10, corners: [.topLeft, .topRight])
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)

            Button(action: {
                isPresented = true
            }) {
                Image("plus_tabbar")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .offset(y: -50)
            }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $isPresented) {
                PlusView()
            }
        }
    }
}

struct MyTab_Previews: PreviewProvider {
    static var previews: some View {
        MyTab(selectedTab: .constant(.profile))
    }
}
