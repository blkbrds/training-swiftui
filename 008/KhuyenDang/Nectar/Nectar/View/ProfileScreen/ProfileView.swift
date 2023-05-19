//
//  ProfileView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var tabbarRouter: TabBarRouter
    @EnvironmentObject var appRouter: AppRouter
    @StateObject var viewModel = ProfileViewModel()
    @State var isLoading: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Profile")
                    .font(.system(size: 20))
                    .padding()
                MySubTabView(tabbarRouter: tabbarRouter)
                Spacer()
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
                        HStack(spacing: 50) {
                            Image("logout")
                                .resizable()
                                .frame(width: 35, height: 30)
                                .padding(.leading, 30)
                            Text("Logout")
                                .font(.system(size: 20))
                                .foregroundColor(Color("green"))
                            Spacer()
                        }
                            .frame(width: UIScreen.main.bounds.width - 80, height: Define.heightButton)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    })
                    .padding(.bottom, 40)
            }
            if isLoading {
                ProgressView()
                    .scaleEffect(3.0)
                    .tint(Color("green"))
            }
        }
            .disabled(isLoading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
