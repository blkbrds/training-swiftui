//
//  LoginView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appRouter: AppRouter
    @State var email: String = ""
    @State var password: String = ""
    @State var error: Bool = false

    var body: some View {
        NavigationView {
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
                    InputCell(value: $email, type: .email)
                    InputCell(value: $password, type: .password)

                    if error {
                        HStack {
                            Text("Incorrect email or password")
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
                        appRouter.state = .tabbar
                    },
                        label: {
                            Text("Log In")
                                .frame(width: Define.widthButton, height: Define.heightButton)
                                .myButtonModifier()
                        })
                        .disabled(!email.validateEmail() || password.isEmpty)

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
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
