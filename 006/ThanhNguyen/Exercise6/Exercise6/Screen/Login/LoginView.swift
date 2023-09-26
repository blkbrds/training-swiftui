//
//  LoginView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appRouter: AppRouter
    @StateObject var viewModel: LoginViewModel = .init()

    var body: some View {
        content(viewModel.state)
    }

    @ViewBuilder
    private func content(_ state: LoginViewModel.LoginState) -> some View {
        switch state {
        case .loading:
            LoadingView()
        default:
            GeometryReader { geo in
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ZStack {
                                Image("img_login")
                                    .resizable()
                                    .frame(width: 400, height: 300)
                                    .padding(.leading, 140)
                                VStack(spacing: 15) {
                                    Text("Welcome back")
                                        .font(.system(size: 35, weight: .bold))
                                        .padding(.top, 80)
                                    Text("Sign in to access your account")
                                        .font(.system(size: 15, weight: .light))
                                        .foregroundColor(.primary)
                                }
                            }
                            VStack(spacing: 15) {
                                LoginTextField(data: $viewModel.email, type: .email)
                                    .frame(maxHeight: 50)
                                    .padding([.trailing, .leading], 30)
                                LoginTextField(data: $viewModel.password, type: .password)
                                    .frame(maxHeight: 50)
                                    .padding([.trailing, .leading], 30)
                                HStack(alignment: .bottom) {
                                    CheckBoxView(checked: $viewModel.isChecked)
                                    Text("Remember me")
                                        .font(.system(size: 11, weight: .light))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Button("Forget password ?") {
                                        viewModel.email = ""
                                        viewModel.password = ""
                                    }
                                    .font(.system(size: 11, weight: .regular))
                                    .foregroundColor(Color("backgroundPink"))
                                }
                                .padding([.trailing, .leading], 30)
                            }
                            .frame(minHeight: 150)
                            Spacer()
                            VStack(spacing: 20) {
                                Button("Login") {
                                    Task {
                                        await viewModel.validateAccount()
                                        if viewModel.state == .success {
                                            appRouter.state = .home
                                        }
                                    }
                                }
                                .loginButton()
                                .padding([.trailing, .leading], 30)
                                .disabled(!viewModel.validateSignInButton())
                                .alert(Text("Login error"), isPresented: $viewModel.shouldShowErrorAlert) { } message: {
                                    Text(viewModel.errorTitle)
                                }
                                HStack {
                                    Text("New member ?")
                                        .font(.system(size: 18, weight: .light))
                                    Button("Register now") {
                                        print("Register now")
                                    }
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color("backgroundPink"))
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}