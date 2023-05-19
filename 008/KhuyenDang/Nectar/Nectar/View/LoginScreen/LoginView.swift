//
//  LoginView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var tabbarRouter: TabBarRouter
    @State var error: Bool = false
    @StateObject var viewModel = LoginViewModel()
    @State var isLoading: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Image("carrot")
                        Spacer()
                            .frame(height: 100)
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Loging")
                                    .font(.system(size: 26, weight: .semibold))

                                Text("Enter your email and password")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                            .padding(.bottom, 30)
                        InputCell(value: $viewModel.email, type: .email)
                        InputCell(value: $viewModel.password, type: .password)

                        if error {
                            HStack {
                                Text(viewModel.contentAlert)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                        HStack {
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot Password?")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                            }
                        }
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        Button(action: {
                            Task {
                                isLoading = true
                                await viewModel.isValidAccount()
                                if viewModel.isLoginSuccess {
                                    appRouter.state = .tabbar
                                    tabbarRouter.currentTab = .home
                                    viewModel.resetData()
                                } else {
                                    error = true
                                }
                                isLoading = false
                            }
                        },
                            label: {
                                Text("Log In")
                                    .frame(width: Define.widthButton, height: Define.heightButton)
                                    .myButtonModifier()
                            })
                            .disabled(!viewModel.email.validateEmail() || viewModel.password.isEmpty)

                        HStack(spacing: 10) {
                            Text("Don't have an account?")
                                .font(.system(size: 14, weight: .semibold))
                            NavigationLink(destination: RegistrationView()
                                , label: {
                                    Text("Sign Up")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color("green"))
                                })
                        }
                            .padding(.top)
                    }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    Spacer()
                }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .background(
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
                if isLoading {
                    ProgressView()
                        .scaleEffect(3.0)
                        .tint(Color("green"))
                }
            }
                .disabled(isLoading)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
