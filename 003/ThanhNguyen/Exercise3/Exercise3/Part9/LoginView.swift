//
//  LoginView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appRouter: AppRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isValidate: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                Text("Login")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .font(.system(size: 40, weight: .thin, design: .serif))
                    .padding(.bottom, 20)
                BaseTextField(data: $email, type: .email)
                    .frame(height: 50)
                    .padding(.bottom, 10)
                BaseTextField(data: $password, type: .password)
                    .frame(height: 50)
                    .padding(.bottom, 10)
                Button {
                    print("--->", email, password)
                } label: {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                .baseButton()
                .padding(.bottom, 5)
                .disabled(isValidate == validateSignInButton(email: email, password: password))
                Button {
                    email = ""
                    password = ""
                    appRouter.state = .welcome
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                .baseButton()
                .padding(.bottom, 20)
                Text("Forgot password?")
                    .frame(maxWidth: .infinity, maxHeight: 10, alignment: .trailing)
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.secondary)
                    .padding(.trailing, 5)
                    .onTapGesture {
                        print("forgot password")
                    }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(20)
                VStack(spacing: 20) {
                    BaseButton(type: .facebook)
                    BaseButton(type: .google)
                    BaseButton(type: .apple)
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 20))
                    Button("Register") {
                        print("register")
                    }
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.pink)
                }
            }
        }
        .padding()
    }

    private func validateSignInButton(email: String, password: String) -> Bool {
        return email.count >= 8 && password.count >= 8
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
