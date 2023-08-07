//
//  LoginFormView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct LoginFormView: View {

    // TODO: Properties
    @State var checked = false
    @State var loginSuccess: Bool = false
    internal var didAppear: ((Self) -> Void)?
    
    @StateObject var viewModel = LoginFormViewModel()

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Image("MyLogoBat")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 90)
                    .padding(50)
                VStack(spacing: -10.0) {
                    VStack(alignment: .leading, spacing: -8.0) {
                        CustomLoginTextField(title: "Email", value: $viewModel.email, isPassword: false)
                            .tag("emailTextField")
                    }
                    VStack(alignment: .leading, spacing: -8.0) {
                        CustomLoginTextField(title: "Password", value: $viewModel.password, isPassword: true)
                            .tag("passWordTextField")
                    }
                }
                HStack(alignment: .center, spacing: 60.0) {
                    HStack {
                        Button(action: {
                            checked = !checked
                        }) {
                            CheckBoxView(checked: $checked)
                        }
                        Text("Remember Me")
                            .foregroundColor(checked == true ? .pink : .gray)
                            .italic()
                    }
                    Button(action: {

                    }) {
                        Text("Forgot Password?")
                            .underline()
                            .foregroundColor(.blue.opacity(0.8))
                    }
                }
                VStack {
                    Button(action: {
                        loginSuccess = true
                    }) {
                        Text("Log In")
                            .foregroundColor(.black)
                            .italic()
                            .font(.system(size: 20, weight: .bold, design: .serif))
                    }
                    .frame(width: 300, height: 60)
                    .background(LinearGradient(colors: [Color("LoginButtonColor"), .blue.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading).opacity(viewModel.checkDisableLoginButton() ? 0.4 : 1))
                    .cornerRadius(20)
                    .shadow(color: Color("LoginButtonColor"), radius: 4)
                    .disabled(viewModel.checkDisableLoginButton())
                    .onAppear { self.didAppear?(self) }
                }.padding(20)
                HStack {
                    Text("Don't Have An Account ?")
                        .foregroundColor(.black.opacity(0.8))
                    Button(action: {

                    }) {
                        Text("Sign Up")
                            .underline()
                            .foregroundColor(.blue.opacity(0.8))
                    }
                }
                HStack {
                    Button(action: {
                        print("Login With FaceBook Account")
                    }) {
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {
                        print("Login With Google Account")
                    }) {
                        Image("google")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {
                        print("Login With Twitter Account")
                    }) {
                        Image("twitter")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView()
    }
}

struct CheckBoxView: View {

    @Binding var checked: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .trim(from: 0, to: 1)
                .fill(checked ? Color.pink : Color.gray.opacity(0.2))
                .frame(width: 20, height: 20)
            if checked {
                Image(systemName: "checkmark.diamond")
                    .foregroundColor(Color.white)
            }
        }
    }
}
