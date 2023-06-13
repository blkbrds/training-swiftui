//
//  ProfileView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct ProfileView: View {

    enum TabView: Int, CaseIterable {
        case photos
        case videos
        case posts
        case about

        var toString: String {
            switch self {
            case .photos:
                return "PHOTOS"
            case .videos:
                return "VIDEOS"
            case .posts:
                return "POSTS"
            case .about:
                return "ABOUT"
            }
        }
    }

    @State private var selectedTab: TabView = .photos
    let widthTab: CGFloat = UIScreen.main.bounds.size.width / 6

    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                Image("tienle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Text("Tien Le P.VN Da Nang")
                    .foregroundColor(.white)
                    .bold()
                Text("Engineering Manager")
                HStack {
                    Image("active")
                    Text("Active")
                    Spacer()
                }
                    .padding(.leading, 20)
                HStack {
                    Image("active")
                    Text("10:51 PM local time")
                    Spacer()
                }
                    .padding(.leading, 20)

                Button {
                    // handler later
                } label: {
                    Image(systemName: "message.badge")
                    Text("Message")
                }
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
                    .padding(.bottom, 20)

                Button {
                    // handler later
                } label: {
                    Image(systemName: "beats.headphones")
                    Text("Huddle")
                }
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )

                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(TabView.allCases, id: \.self) { kind in
                                Button(action: {
                                    selectedTab = kind
                                }) {
                                    VStack {
                                        Text(kind.toString)
                                            .frame(width: widthTab, height: 20, alignment: .center)
                                            .foregroundColor(selectedTab == kind ? .blue : .gray)
                                            .font(.subheadline)
                                            .padding()
                                        if selectedTab == kind {
                                            Rectangle()
                                                .frame(width: 50, height: 1)
                                        }
                                    }
                                }
                            }
                        }
                    }
                        .background(Color.black)
                        .padding(.bottom, 1)

                    VStack {
                        switch selectedTab {
                        case .photos:
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 20) {
                                    ForEach(0..<5, id: \.self) { index in
                                        PopularView()
                                    }
                                }
                            }
                        case .videos:
                            PopularView()
                        case .posts:
                            PopularView()
                        case .about:
                            PopularView()
                        }
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
