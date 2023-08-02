//
//  LoginView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

struct Define {
    static let loginTintColor = "LoginTintColor"
    static let loginBlurTintColor = "LoginBlurTintColor"
}

struct LoginView: View {

    @State var username: String
    @State var password: String

    var body: some View {
        let isInValid: Bool = username.isEmpty || password.isEmpty
        VStack(alignment: .leading, spacing: 10) {
            VStack {
            }.frame(width: .infinity, height: 10)

            Image("img-login-banner")
                .resizable()
                .frame(width: 320, height: 203)

            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome Back!")
                    .appColorTitleTextLoginModifier()
                    .padding(.leading, 40)
                Text("Hi, Kindly login to continue battle")
                    .normalTextLoginModifier()
                    .padding(.leading, 40)
            }
            .padding(.top, 20)

            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .loginTextFieldsModifier(submitType: .next)

                SecureField("Password", text: $password)
                    .loginTextFieldsModifier(submitType: .done)
                HStack(alignment: .lastTextBaseline) {
                    Spacer()
                    Text("Forgot password?")
                        .normalTextLoginModifier()
                        .padding(.trailing, 40)
                }
            }
            .padding(.top, 10)

            VStack {
                HStack {
                    Button {
                        username = ""
                        password = ""
                    } label: {
                        Text("Let's Combat!")
                            .loginButtonTextModifier()
                    }
                    .loginButtonModifier()
                    .disabled(isInValid)
                    .overlay {
                        if isInValid {
                            Color(red: 1, green: 1, blue: 1, opacity: 0.8)
                        }
                    }
                    .cornerRadius(29)
                }
                .frame(width: 224, height: 58)

                HStack {
                    Button {
                        username = ""
                        password = ""
                    } label: {
                        Text("Let's Cancel!")
                            .loginButtonTextModifier()
                    }
                    .loginButtonModifier()
                    .cornerRadius(29)
                }
                .frame(width: 224, height: 58)

                HStack(spacing: 5) {

                    Text("Connect With")
                        .appColorTextLoginModifier()

                    Button {
                        
                    } label: {
                        Image("img-google")
                    }
                    .frame(width: 50, height: 50)
                    Button {

                    } label: {
                        Image("img-facebook")
                    }
                    .frame(width: 50, height: 50)
                }
                .frame(maxWidth: .infinity)

                HStack(spacing: 5) {
                    Text("Don't have an account?")
                        .normalTextLoginModifier()

                    Text("Create account")
                        .appColorTextLoginModifier()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "", password: "")
    }
}
