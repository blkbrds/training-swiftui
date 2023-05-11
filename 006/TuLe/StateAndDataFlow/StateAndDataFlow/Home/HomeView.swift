//
//  HomeView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 11/04/2023.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var appRouter: StorageData

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(viewModel.user?.email ?? "123")
                Text(viewModel.user?.password ?? "456")
                NavigationLink {
                    EditView(viewModel: EditViewModel(user: viewModel.user ?? User(email: "", password: "")))
                } label: {
                    Text("Edit")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                NavigationLink {
                    SettingView(viewModel: SettingViewModel(user: viewModel.user ?? User(email: "", password: ""), isNortify: appRouter.nortify, isDarkMode: appRouter.isDarkMode))
                } label: {
                    Text("Setting")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button {
                    appRouter.dataLogin = nil
                    appRouter.appState = .login
                } label: {
                    Text("Log out")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            .task {
                await viewModel.loadData(data: appRouter.dataLogin)
            }
            .navigationTitle("HomeScreen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
