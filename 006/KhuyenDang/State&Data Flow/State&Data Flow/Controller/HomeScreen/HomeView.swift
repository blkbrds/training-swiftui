//
//  HomeView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/04/2023.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var account: Account
    @StateObject var viewModel = HomeViewModel()
    @State var isLoading: Bool = false

    fileprivate func MyText(value: String) -> Text {
        return Text(value)
            .font(.system(size: 20))
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .mask(Circle())
                        .frame(width: 150)
                        .padding(.top, 130)
                        .padding(.bottom, 50)
                        .background(.clear)

                    HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            MyText(value: "Fullname:")
                            MyText(value: "Age:")
                            MyText(value: "Address:")
                        }

                        VStack(alignment: .leading) {
                            MyText(value: account.fullname ?? "")
                            MyText(value: "\(account.age ?? 0)")
                            MyText(value: account.address ?? "")
                        }
                    }

                    Button(action: {

                        Task {
                            isLoading = true
                            guard await viewModel.logout() else {
                                isLoading = false
                                return
                            }
                            appRouter.state = .login
                            isLoading = false
                        }
                    }
                        , label: {
                            HStack {
                                Text("Logout")
                                    .foregroundColor(Color("primaryColor"))
                                    .font(.system(size: 20))
                                Image("logout")
                                    .resizable()
                                    .frame(width: 40, height: 35)
                            }
                        })
                        .padding(.top, 30)

                    Spacer()
                }

                if isLoading {
                    ProgressView()
                        .scaleEffect(3.0)
                        .tint(Color("primaryColor"))
                }
            }
                .onAppear {
                viewModel.loadData(account: account)
            }
                .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: EditView(viewModel: viewModel.viewModelForEdit(account: account))) {
                        Text("Edit")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        Text("Setting")
                    }
                }
            }
                .ignoresSafeArea()
        }
            .disabled(isLoading)
    }
}
