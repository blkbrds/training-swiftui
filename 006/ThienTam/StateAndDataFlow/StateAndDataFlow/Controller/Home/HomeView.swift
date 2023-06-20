//
//  HomeView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 16/06/2023.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var viewModel =  HomeViewModel()
    let widthTab: CGFloat = UIScreen.main.bounds.size.width / 6

    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                    .font(.largeTitle)
                Image("ic_welcome")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .shadow(radius: 10)
                Text("Tien Le P.VN Da Nang")
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                    .padding(.bottom, 20)
                    .padding(.horizontal)

                Button {
                    appRouter.state = .login
                    viewModel.clearUser()
                } label: {
                    Image(systemName: "beats.headphones")
                    Text("Log out")
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
                    .padding(.horizontal)

                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(TabView.allCases, id: \.self) { kind in
                                Button(action: {
                                    viewModel.setSelectedTab(tab: kind)
                                }) {
                                    VStack {
                                        Text(kind.toString)
                                            .frame(width: widthTab, height: 20, alignment: .center)
                                            .foregroundColor(viewModel.isSameTab(tab: kind) ? .blue : .gray)
                                            .font(.subheadline)
                                            .padding()
                                        if viewModel.isSameTab(tab: kind) {
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
                        switch viewModel.selectedTab {
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
                .foregroundColor(.black)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
