//
//  DetailView.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 29/06/2023.
//

import SwiftUI

struct DetailView: View {

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
    let user: User

    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                Image(user.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .shadow(radius: 10)
                Text(user.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                Text(user.smallTitle)
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
                    .foregroundColor(.black)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)

                Button {
                    // handler later
                } label: {
                    Image(systemName: "beats.headphones")
                    Text("Huddle")
                }
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                    .padding(.horizontal, 20)

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
                        .background(Color.white)
                        .padding(.bottom, 1)

                    VStack {
                        switch selectedTab {
                        case .photos:
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 20) {
                                    ForEach(0..<5, id: \.self) { index in
                                        Text("Demo")
                                    }
                                }
                            }
                        case .videos:
                            Text("Demo")
                        case .posts:
                            Text("Demo")
                        case .about:
                            Text("Demo")
                        }
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .foregroundColor(.black)
        }
        .navigationTitle("Detail")
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(imageName: "tien", largeTitle: "abc", smallTitle: "ddd"))
    }
}
