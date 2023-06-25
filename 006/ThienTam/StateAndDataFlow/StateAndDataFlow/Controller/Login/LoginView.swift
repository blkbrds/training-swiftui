//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 13/06/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var viewModel =  LoginViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                    .overlay {
                    VStack {
                        Image("flag")
                            .resizable()
                            .frame(width: 87, height: 48)
                        Text("WELCOME BACK")
                            .foregroundColor(Color("welcome"))
                            .bold()
                            .padding(.horizontal)
                    }
                        .padding(.horizontal)
                }
                Text("LOG IN WITH EMAIL")
                    .foregroundColor(Color("textDefault"))
                    .bold()
                    .padding(.horizontal)

                TextField("Email address", text: $viewModel.username)
                    .frame(height: 63)
                    .padding(.horizontal)
                    .background(Color("placeHolder"))
                    .cornerRadius(10)

                SecureField("Password", text: $viewModel.password)
                    .frame(height: 63)
                    .padding(.horizontal)
                    .background(Color("placeHolder"))
                    .cornerRadius(10)

                Spacer()
                Button(action: {
                    Task {
                        await viewModel.submitButton()
                        if viewModel.isLoggedIn {
                            appRouter.state = .home
                        }
                    }
                }) {
                    Text(viewModel.titleButton)
                        .foregroundColor(Color("welcome"))
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 63)
                        .padding(.horizontal)
                        .background(viewModel.colorButton)
                        .cornerRadius(10)
                }
                    .disabled(!viewModel.isLoginButtonEnabled)
            }
                .padding(.horizontal)
                .padding(.bottom, 36)

            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            }
        }
        .alert(viewModel.alertString, isPresented: $viewModel.isShowAlert, actions: {

        })
            .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
