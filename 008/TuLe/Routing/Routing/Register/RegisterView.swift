//
//  RegisterView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 10/05/2023.
//

import SwiftUI

struct RegisterView: View {

    @Binding var rootIsActive : Bool
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack(spacing: 50) {
            Text("Create an account")
                .font(.title)
                .fontWeight(.heavy)
            VStack (alignment: .leading, spacing: 20) {
                UnderlineTextFieldView(title: "Email", value: $viewModel.email)
                if !viewModel.email.isValidEmail() && viewModel.email != "" {
                    ErrorView(imageName: ErrorType.wrong.getImageError(), messageError: "Email invalidate")
                }
                UnderlineTextFieldView(title: "Username", value: $viewModel.userName)
                if viewModel.userName.count < 4 && viewModel.userName != "" {
                    ErrorView(imageName: ErrorType.wrong.getImageError(), messageError: "A minimum of 4 characters")
                }
                ZStack(alignment: .trailing) {
                    UnderlineTextFieldView(title: "Password", value: $viewModel.password, isPassword: true)
                    
                    Button(action: {
                        viewModel.isShowPassword.toggle()
                    }, label: {
                        Image(systemName: viewModel.isShowPassword ? "eye.slash" : "eye")
                            .accentColor(.gray)
                            .padding(.horizontal)
                            .padding(.horizontal, 5)
                    })
                }
                if viewModel.password.count < 8 && viewModel.password != "" {
                    ErrorView(imageName: ErrorType.unlock.getImageError(), messageError: "A minimum of 8 characters")
                }
                UnderlineTextFieldView(title: "Confirm Password", value: $viewModel.confirmPassword, isPassword: true)
                if viewModel.confirmPassword != viewModel.password && viewModel.confirmPassword != ""  {
                    ErrorView(imageName: ErrorType.wrong.getImageError(), messageError: "Password must be the same")
                }
            }
            
            Button {
                print("")
            } label: {
                Text("Sign up")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical, 17)
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [
                            Color(red: 251 / 255, green: 138 / 255, blue: 127 / 255),
                            Color(red: 252 / 255, green: 192 / 255, blue: 104 / 255)
                        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .scaleEffect(x: viewModel.isSignUpDisable() ? 1 : 0, y: 1)
            )
            .background(.gray)
            .disabled(!viewModel.isSignUpDisable())
            .cornerRadius(10)
            .padding()
            
            VStack {
                HStack {
                    Text("Already have an account? ")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Text("Sign in")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.pink)
                        .onTapGesture {
                            rootIsActive = false
                        }
                }
                
                VStack {
                    Text("if you don't remember the password")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    NavigationLink {
                        ForgotPasswordView(shouldPopToRootView: $rootIsActive)
                    } label: {
                        Text("Forgot password")
                        .font(.system(size: 15))
                        .foregroundColor(.pink)
                    }
                    
                }
            }

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .animation(Animation.default)
        .padding(.horizontal, 30)
    }
    
    func checkUserName(number: Int) -> Bool {
        withAnimation {
            return number > 4
        }
    }
}

struct UnderlineTextFieldView: View {
    var title: String
    @Binding var value: String
    var isPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            if !isPassword {
                TextField(title, text: $value)
                    .modifier(styleUnderLineTextField())
            } else {
                SecureField(title, text: $value)
                    .modifier(styleUnderLineTextField())
            }
            Rectangle()
                .frame(height: 0.5)
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
        }
    }
}

struct styleUnderLineTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .font(.system(size: 20))
    }
}
