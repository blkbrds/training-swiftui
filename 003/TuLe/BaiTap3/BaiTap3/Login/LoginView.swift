//
//  LoginView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct LoginView: View {

    @State var email: String = ""
    @State var password: String = ""
    @State var isShowPassword: Bool = false
    var placeholderEmail: String = "Enter your email"
    var placeholderPassword: String = "Enter your password"
    

    var body: some View {
        VStack {
            BackgroundLoginView()
            
            LoginTextFieldView(data: $email, placeholder: placeholderEmail)
            
            ZStack(alignment: .trailing) {
                LoginTextFieldView(data: $password, placeholder: placeholderPassword, isShowPassword: isShowPassword)
                Image(systemName: isShowPassword ? "eye.slash" : "eye")
                    .padding(.horizontal, 50)
                    .offset(x: 0, y : 10)
                    .onTapGesture {
                        isShowPassword = !isShowPassword
                    }
            }
            
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .padding(.trailing, 40)
                    .padding(.top, 8)
                    .foregroundColor(.blue)
                    .font(.system(size: 14))
            }
            
            LoginButtonView(email: email, password: password)
            
            HStack {
                TypeLoginView(imageName: "FBIcon")
                TypeLoginView(imageName: "AppleIcon")
                TypeLoginView(imageName: "GoogleIcon")
            }
            .padding(.horizontal, 40)
            .padding(.top, 20)

            Spacer()

            HStack {
                Text("Don’t have an account?")
                    .font(.system(size: 15))
                Text("Register Now")
                    .foregroundColor(Color(red: 255 / 255, green: 138 / 255, blue: 21 / 255))
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
            }

            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
