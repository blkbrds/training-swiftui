//
//  LoginView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

struct LoginView: View {

    @State var email: String
    @State var password: String
    @State private var isValidate: Bool = false
    @State private var isChecked = false
    public var didAppear: ((Self) -> Void)?

    var body: some View {
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
                LoginTextField(data: $email, type: .email)
                    .frame(maxHeight: 50)
                    .padding([.trailing, .leading], 30)
                LoginTextField(data: $password, type: .password)
                    .frame(maxHeight: 50)
                    .padding([.trailing, .leading], 30)
                HStack(alignment: .bottom) {
                    CheckBoxView(checked: $isChecked)
                    Text("Remember me")
                        .font(.system(size: 11, weight: .light))
                        .foregroundColor(.black)
                    Spacer()
                    Button("Forget password ?") {
                        email = ""
                        password = ""
                    }
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(Color("backgroundPink"))
                    .onAppear {
                        self.didAppear?(self)
                    }
                }
                .padding([.trailing, .leading], 30)
            }
            Spacer()
            VStack(spacing: 20) {
                Button("Login") {
                    print("--->", email, password)
                }
                .loginButton()
                .padding([.trailing, .leading], 30)
                .disabled(isValidate == validateSignInButton(email: email, password: password))
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
    }

    private func validateSignInButton(email: String, password: String) -> Bool {
        return email.count >= 8 && password.count >= 8
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor( checked ? .blue : .secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email: "", password: "")
    }
}
