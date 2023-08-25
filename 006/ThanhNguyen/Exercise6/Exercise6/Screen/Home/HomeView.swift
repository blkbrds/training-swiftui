//
//  HomeView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 23/08/2023.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    @StateObject var viewModel: HomeViewModel = .init()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("img_luffy_g5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(.infinity)
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Nickname:")
                                .frame(minWidth: 100, alignment: .leading)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.gray)
                            Text(viewModel.account?.nickname ?? "")
                                .font(.system(size: 20, weight: .semibold))
                        }
                        HStack {
                            Text("Address:")
                                .frame(minWidth: 100, alignment: .leading)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.gray)
                            Text(viewModel.account?.address ?? "")
                                .font(.system(size: 20, weight: .semibold))
                        }
                    }
                    .padding([.leading, .trailing], 50)
                    HStack(spacing: 50) {
                        NavigationLink(destination: EditView(viewModel: .init(profileAccount: viewModel.account))) {
                            HomeButton(title: "Edit Profile")
                        }
                        NavigationLink(destination: SettingView()) {
                            HomeButton(title: "Setting")
                        }
                    }
                    .padding(.top, 50)
                    Spacer()
                }
            }
            .task {
                await viewModel.getSavedAccount()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.shouldShowLogoutAlert) {
                Alert(
                    title: Text("Warning"),
                    message: Text("Are you sure you want to log out?"),
                    primaryButton: .default(Text("Log me out")) {
                        viewModel.logout()
                        appRouter.state = .login
                    },
                    secondaryButton: .cancel()
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "arrowshape.turn.up.backward.2")
                        .onTapGesture {
                            viewModel.shouldShowLogoutAlert = true
                        }
                }
            }
        }
    }
}

struct HomeButton: View {

    var title: String

    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(Color("primaryColor"))
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .overlay {
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(style: .init())
                    .fill(Color("primaryColor"))
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
